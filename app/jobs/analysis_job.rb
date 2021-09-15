# frozen_string_literal: true

class AnalysisJob < ApplicationJob
  queue_as :default

  def perform(processing, analysis_type, category = nil)
    @processing = processing
    @analysis_type = analysis_type
    @category = category

    RequestBuilder.send_post_request(JSON.parse(content), url, false)
  end

  private

  def url
    url = "#{base_url}/#{@analysis_type}#{query_params}"

    URI(url)
  end

  def base_url
    ENV['BASIC_LINGUISTIC_INDICATORS_URL']
  end

  def query_params
    params = {}
    params["token"] = token
    params["analysis_id"] = analysis.id
    params["subset_category"] = @category if @category.present?

    "?#{params.to_query}"
  end

  def analysis
    Analysis.find_or_create_by!(typename: @analysis_type, processing: @processing, category: @category)
  end

  def token
    TokenManager.generate_token(analysis.string_to_generate_token)
  end

  def content
    @processing.preprocessed_file_data.download
  end
end
