class StaticController < ApplicationController
  def index
    @urls = Url.new
  end
end
