class PagesController < ApplicationController
  def home
    @date = Time.now
  end
end
