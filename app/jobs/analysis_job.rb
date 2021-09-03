# frozen_string_literal: true


class AnalysisJob < ApplicationJob
  queue_as :default

  def perform(processing, analysis_type)
    @processing = processing
    @analysis_type = analysis_type

    RequestBuilder.send_post_request(JSON.parse(content), url, false)
  end

  private

  def url
    URI("#{base_url}/#{@analysis_type}?token=#{token}&analysis_id=#{analysis.id}")
  end

  def base_url
    ENV['BASIC_LINGUISTIC_INDICATORS_URL']
  end

  def analysis
    Analysis.find_or_create_by!(typename: @analysis_type, processing: @processing)
  end

  def token
    TokenBuilder.generate_token("#{analysis.cache_version}_#{@processing.preprocessed_file_data.checksum}")
  end

  def content
    @processing.preprocessed_file_data.download
  end
end
