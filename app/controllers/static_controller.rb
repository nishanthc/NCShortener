class StaticController < ApplicationController
  def index
    @short_code = params[:short_code]
    @long_url = params[:long_url]
    @urls = Url.new
  end
end
