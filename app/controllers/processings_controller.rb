class ProcessingsController < ApplicationController
  before_action :set_processing, only: %i[ wordcloud_analysis speech_analysis redo_analysis]

  # GET /processings or /processings.json
  def index
    @processings = Processing.processed
  end

  def wordcloud_analysis
  end

  def speech_analysis
  end

  def redo_analysis
    AnalysisesJob.perform_later(@processing)

    respond_to do |format|
      format.html { redirect_to processings_path, notice: "Analysis has been triggered." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processing
      @processing = Processing.find(params[:processing_id])
    end
end
