# frozen_string_literal: true

# Processings Controller
class ProcessingsController < ApplicationController
  # GET /processings or /processings.json
  def index
    @query = Processing.processed.ransack(params[:q])
    @processings = @query.result(distinct: true).page(params[:page])
  end
end
