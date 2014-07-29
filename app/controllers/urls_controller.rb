class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end
def longify
@short_code = params[:short_code]
@search = Url.find_by_short_code(@short_code)
if @search.blank?
redirect_to root_url, notice: "Invalid URL"

else

redirect_to @search.long_url


end

end


  def create

    # Instantiate a new object using form parameters
    @url = Url.new(params.require(:url).permit(:long_url))
    @long_url = @url.long_url

    @url.ip_address = request.remote_ip
    # Save the object
@search = Url.find_by_long_url(@long_url)
if !@search.blank?
@old_url = Url.find_by long_url: @long_url
@old_id = @old_url.id

@old_short_code = @old_id = @old_url.short_code
redirect_to root_url(:short_code => @old_short_code), :notice => 'Your short URL has been created'

else

    if @url.save
    @new_url = Url.find_by long_url: @long_url
    @id = @new_url.id
    @short_code = (@id.to_s + (1+69).to_s).reverse.to_i.to_s(36)
    @new_url.update({:short_code => @short_code})
      # If save succeeds, redirect to the index action
      redirect_to root_url(:short_code => @short_code), :notice => 'Your short URL has been created!'
    else
      # If save fails, redisplay the form so user can fix problems
redirect_to root_url, notice: "You must enter a valid URL"

    end
  end
end
end
