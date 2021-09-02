# frozen_string_literal: true


class AnalysisJob < ApplicationJob
  queue_as :default

  def perform(processing, analysis)
    content = processing.preprocessed_file_data.download
    response = RequestBuilder.send_post_request(JSON.parse(content), url(analysis))
    model = Analysis.find_or_create_by!(typename: analysis, processing: processing)

    FileAttacher.attach_file(model, :file, response.body, analysis, detect_extension(analysis))
  end

  private

  def url(analysis)
    URI("#{base_url}/#{analysis}")
  end

  def base_url
    ENV["BASIC_LINGUISTIC_INDICATORS_URL"]
  end

  def detect_extension(analysis)
    if analysis == "wordclouds"
      "png"
    else
      "xlsx"
    end
  end
end
