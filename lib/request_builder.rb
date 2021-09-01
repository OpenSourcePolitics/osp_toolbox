# frozen_string_literal: true

require "json"
require "net/http"
require "uri"

# This module provides methods for building an http request
module RequestBuilder
  def self.send_post_request(content, url, wait_for_answer = true)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request.body = JSON.dump(content)
    request = http.request(request)

    request.finish unless wait_for_answer

    return request if request.code == "200"

    raise "Request error, code: #{request.code}"
  end
end
