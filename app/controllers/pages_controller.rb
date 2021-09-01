# frozen_string_literal: true

# Pages controller
class PagesController < ApplicationController
  def home
    @date = Time.zone.now
  end
end
