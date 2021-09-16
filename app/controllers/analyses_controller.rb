class AnalysesController < ApplicationController
  before_action :set_analysis, only: %i[ show edit update destroy redo_analysis ]
  before_action :set_processing, only: [:index, :new, :create]

  # GET /analyses or /analyses.json
  def index
    @query = @processing.analyses.ransack(params[:q])
    @analyses = @query.result(distinct: true).page(params[:page])
  end

  # GET /analyses/1 or /analyses/1.json
  def show
  end

  # GET /analyses/new
  def new
    @analysis = Analysis.new(processing: @processing)
  end

  # POST /analyses or /analyses.json
  def create
    @analysis = Analysis.new(analysis_params.merge(processing: @processing))

    respond_to do |format|
      if @analysis.save
        AnalysisJob.perform_later(@analysis.processing, @analysis.typename, @analysis.category)

        format.html { redirect_to processing_analysis_path(id: @analysis), notice: "Analysis was successfully created." }
        format.json { render :show, status: :created, location: @analysis }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analyses/1 or /analyses/1.json
  def destroy
    @analysis.destroy
    respond_to do |format|
      format.html { redirect_to processing_analyses_path, notice: "Analysis was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def redo_analysis
    AnalysisJob.perform_later(@analysis.processing, @analysis.typename, @analysis.category)

    respond_to do |format|
      format.html { redirect_to processing_analyses_path, notice: "Analysis has been triggered." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_analysis
    @analysis = Analysis.find(params.try(:[], :id) || params.try(:[], :analysis_id))
  end

  def set_processing
    @processing = Processing.find(params[:processing_id])
  end

  # Only allow a list of trusted parameters through.
  def analysis_params
    params.require(:analysis).permit(:typename, :category)
  end
end
