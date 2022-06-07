# frozen_string_literal: true

# Analyses Controller
class AnalysesController < ApplicationController
  before_action :set_analysis, only: %i[show destroy redo_analysis]
  before_action :set_processing, only: %i[index new create]

  # GET /analyses or /analyses.json
  def index
    @query = @processing.analyses.ransack(params[:q])
    @analyses = @query.result(distinct: true).page(params[:page])
  end

  # GET /analyses/1 or /analyses/1.json
  def show; end

  # GET /analyses/new
  def new
    @analysis = Analysis.new(processing: @processing)
  end

  # POST /analyses or /analyses.json
  # rubocop:disable Metrics/AbcSize
  def create
    @analysis = Analysis.find_or_initialize_by(analysis_params.merge(processing: @processing))

    if @analysis.new_record?
      respond_to do |format|
        if @analysis.save
          AnalysisJob.perform_later(@analysis.processing, @analysis.typename, current_user, @analysis.category)

          format.html { redirect_to processing_analysis_path(id: @analysis), notice: t(".create") }
          format.json { render :show, status: :created, location: @analysis }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @analysis.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to processing_analysis_path(id: @analysis), notice: t(".found")
    end
  end
  # rubocop:enable Metrics/AbcSize

  # DELETE /analyses/1 or /analyses/1.json
  def destroy
    @analysis.destroy
    respond_to do |format|
      format.html { redirect_to processing_analyses_path, notice: t(".destroy") }
      format.json { head :no_content }
    end
  end

  def redo_analysis
    AnalysisJob.perform_later(@analysis.processing, @analysis.typename, current_user, @analysis.category)

    respond_to do |format|
      format.html { redirect_to processing_analyses_path, notice: t(".redo_analysis") }
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
