# frozen_string_literal: true

# Preprocessings data controller
class PreprocessingsDataController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def preprocessed_data
    if TokenBuilder.valid_token?(preprocessing, params[:token])
      preprocessing.update!(preprocessed_data: params[:preprocessings_datum])
      render json: {status: :success}
    else
      render json: {status: :unauthorized}
    end
  end

  private

  def preprocessing
    @preprocessing ||= Preprocessing.find(params[:preprocessing_id])
  end
end