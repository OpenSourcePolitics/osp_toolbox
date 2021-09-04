# frozen_string_literal: true

require "json"
require "net/http"
require "uri"

# This module provides methods for building an http request
module Notification
  def self.send(message)
    url = URI(ENV["ROCKET_CHAT_URL"])

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Content-Type"] = "application/json"
    request.body = JSON.dump({text: message})

    https.request(request)
  end
end