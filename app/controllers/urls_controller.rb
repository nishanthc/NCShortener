class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def add
    @urls = Url.new
  end

  def create
    # Instantiate a new object using form parameters
    @url = Url.new(params.require(:url).permit(:long_url))
    # Save the object
    if @url.save
      # If save succeeds, redirect to the index action
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('add')
    end
  end
end
