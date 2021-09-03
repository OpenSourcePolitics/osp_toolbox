# frozen_string_literal: true

# Analyses data controller
class AnalysesDataController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def store_analysis_data
    if TokenBuilder.valid_token?(analysis.token_to_check_against, params[:token])
      analysis.store_analysis_data!(params[:analysises_datum])

      render json: {status: :success}
    else
      render status: :unauthorized, json: {status: :unauthorized}
    end
  end

  private

  def analysis
    @analysis ||= Analysis.find(params[:analysis_id])
  end
end
