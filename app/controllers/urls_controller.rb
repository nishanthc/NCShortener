class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end


  def create

    # Instantiate a new object using form parameters
    @url = Url.new(params.require(:url).permit(:long_url))
    @long_url = params[:long_url]
    @url.ip_address = request.remote_ip
    # Save the object
    if @url.save
      # If save succeeds, redirect to the index action
      redirect_to root_url(:short_code => "sgs",:long_url => @long_url), :notice => 'Your short URL has been created!'
    else
      # If save fails, redisplay the form so user can fix problems
redirect_to root_url, notice: "You must enter a URL to be shortened."

    end
  end
end
