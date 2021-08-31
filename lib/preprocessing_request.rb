require 'json'
require 'net/http'
require 'uri'

module PreprocessingRequest
  URI = URI(ENV["PREPROCESSING_URL"])

  def self.send_post_request(content, url = URI)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request.body = JSON.dump(content)
    request = http.request(request)

    if request.code != "200"
      raise "Request error, code: #{request.code}"
    else
      request
    end
  end
end