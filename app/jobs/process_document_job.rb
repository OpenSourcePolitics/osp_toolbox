require 'csv'
require 'json'
require 'net/http'
require 'uri'


class ProcessDocumentJob < ApplicationJob
  queue_as :default

  def perform(document)
    output = document.input_files.each_with_object({}) do |item, hash|
      hash[item.typename] = parse_csv(item.file.download)
    end

    send_post_request(output.to_json)
  end

  private

  def parse_csv(data)
    csv = CSV.parse(data.force_encoding("utf-8"), col_sep: "\,")
    csv_header = csv[0]
    csv_content = csv[1..-1]

    csv_content.each_with_object({})
               .with_index { |(row, hash), index| hash[index.to_s] = parse_row(csv_header, row)}
  end

  def parse_row(header, row)
    (0..header.length - 1).each_with_object({}) { |index, hash| hash[header[index]] = row[index] }
  end

  def send_post_request(content)
    url = URI("http://0.0.0.0:5000/?sorting_attribute=comments")

    http = Net::HTTP.new(url.host, url.port);
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request.body = JSON.dump(content)

    # Send the request
    response = http.request(request)
    puts response.read_body

  end
end