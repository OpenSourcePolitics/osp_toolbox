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
      response = Struct.new(:code, :body)
      response.new("404", { "message" => "Service not found" })
    else
      url = URI("#{service[:url]}/ping")
      begin
        response = RequestBuilder.send_get_request(url, raise_error: false)
        response.body = JSON.parse(response.body)
      rescue JSON::ParserError
        response.body = { "message" => response.body }
      end
    end

    response
  end

  def services
    [
      {
        name: "Preprocessing service",
        url: ENV.fetch("PREPROCESSING_URL", nil)
      },
      {
        name: "Basic linguistic indicators service",
        url: ENV.fetch("BASIC_LINGUISTIC_INDICATORS_URL", nil)
      },
      {
        name: "Comments mapping service",
        url: ENV.fetch("COMMENTS_MAPPING_URL", nil)
      }
    ]
  end
end
