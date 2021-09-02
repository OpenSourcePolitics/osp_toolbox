class ProcessingsController < ApplicationController
  before_action :set_processing, only: %i[ show ]

  # GET /processings or /processings.json
  def index
    @processings = Processing.processed
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processing
      @processing = Processing.find(params[:id])
    end
end
