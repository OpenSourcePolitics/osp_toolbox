require 'json'
require 'net/http'
require 'uri'

module CommentsMappingRequest
  def self.send_post_request(content, url = URI("http://127.0.0.1:5000/?sorting_attribute=supports"))
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request.body = JSON.dump(content)

    http.request(request)
  end
end