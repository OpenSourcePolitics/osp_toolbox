class ProcessingsController < ApplicationController
  before_action :set_processing, only: %i[redo_analysis]

  # GET /processings or /processings.json
  def index
    @query = Processing.processed.ransack(params[:q])
    @processings = @query.result(distinct: true).page(params[:page])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processing
      @processing = Processing.find(params[:processing_id])
    end
end
