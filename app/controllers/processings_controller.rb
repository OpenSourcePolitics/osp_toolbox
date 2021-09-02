class ProcessingsController < ApplicationController
  before_action :set_processing, only: %i[ wordcloud_analysis speech_analysis ]

  # GET /processings or /processings.json
  def index
    @processings = Processing.processed
  end

  def wordcloud_analysis

  end

  def speech_analysis

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processing
      @processing = Processing.find(params[:processing_id])
    end
end
