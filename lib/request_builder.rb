# frozen_string_literal: true

require "json"
require "net/http"
require "uri"

# This module provides methods for building an http request
module RequestBuilder
  def self.send_post_request(content, url, wait_for_answer: true)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = url.scheme == "https"
    http.open_timeout = 10 unless wait_for_answer
    http.read_timeout = 10 unless wait_for_answer
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request.body = JSON.dump(content)
    response = http.request(request)
    return response if response.code == "200"

    raise "Request error, code: #{response.code}"
  rescue Net::ReadTimeout, Net::OpenTimeout
    raise "Time out error for #{url}" if wait_for_answer

    Rails.logger.info("A request has been sent to #{url} and wait for answer was set to false")
    true
  end

  def self.send_get_request(url, raise_error: true)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = url.scheme == "https"
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    return response if response.code == "200"

    raise "Request error, code: #{response.code}" if raise_error
  end
end
