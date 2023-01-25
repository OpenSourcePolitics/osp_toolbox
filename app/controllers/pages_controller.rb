# frozen_string_literal: true

# Pages controller
class PagesController < ApplicationController
  def home; end

  def debug
    @services = services.map do |service|
      {
        name: service[:name],
        status: service_status(service)
      }
    end
  end

  private

  def service_status(service)
    if service[:url].nil?
      response = OpenStruct.new(code: "404", body: { message: "Service not found" }.to_json)
    else
      url = URI("#{service[:url]}/ping")
      response = RequestBuilder.send_get_request(url, raise_error: false)
    end

    build_response(response.code, response.body)
  end

  def build_response(code, body)
    body = { message: body } unless body.is_a?(Hash)

    OpenStruct.new(code:, body:)
  end

  def services
    [
      {
        name: "PREPROCESSING_URL",
        url: ENV.fetch("PREPROCESSING_URL", nil)
      },
      {
        name: "BASIC_LINGUISTIC_INDICATORS_URL",
        url: ENV.fetch("BASIC_LINGUISTIC_INDICATORS_URL", nil)
      },
      {
        name: "COMMENTS_MAPPING_URL",
        url: ENV.fetch("COMMENTS_MAPPING_URL", nil)
      }
    ]
  end
end
