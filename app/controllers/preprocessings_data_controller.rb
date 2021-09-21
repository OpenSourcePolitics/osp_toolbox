# frozen_string_literal: true

# Preprocessings data controller
class PreprocessingsDataController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def preprocessed_data
    if TokenManager.valid_token?(preprocessing.string_to_generate_token, params[:token])
      preprocessing.store_preprocessing_data!(params[:preprocessings_datum])

      render json: { status: :success }
    else
      render status: :unauthorized, json: { status: :unauthorized }
    end
  end

  private

  def preprocessing
    @preprocessing ||= Processing.find(params[:preprocessing_id])
  end
end
