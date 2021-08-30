require 'json'
require 'net/http'
require 'uri'

module CommentsMappingRequest
  URI = URI("#{ENV["COMMENTS_MAPPING_URL"]}/?sorting_attribute=supports")

  def self.send_post_request(content, url = URI)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request.body = JSON.dump(content)

    http.request(request)
  end
end
