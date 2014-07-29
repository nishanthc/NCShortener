class StaticController < ApplicationController
  def index
    @short_code = params[:short_code]
    new_url = Url.find_by short_code: @short_code

    if new_url.blank?
    @short_code = ""
  end

    if !new_url.blank? and !@short_code.blank?
    @long_url = new_url.long_url

  else
    @long_url = "Enter a long URL"



    end

    @urls = Url.new
  end
end
