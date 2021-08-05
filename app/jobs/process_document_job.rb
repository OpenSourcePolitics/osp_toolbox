require 'csv'
require 'json'

class ProcessDocumentJob < ApplicationJob
  queue_as :default

  def perform(document)
    output = document.input_files.each_with_object({}) do |item, hash|
      hash[item.typename] = parse_csv(item.file.download)
    end

    output.to_json
  end

  private

  def parse_csv(data)
    csv = CSV.parse(data.force_encoding("utf-8"), col_sep: "\;")
    csv_header = csv[0]
    csv_content = csv[1..-1]

    csv_content.each_with_object({})
               .with_index { |(row, hash), index| hash[index.to_s] = parse_row(csv_header, row)}
  end

  def parse_row(header, row)
    (0..header.length - 1).each_with_object({}) { |index, hash| hash[header[index]] = row[index] }
  end
end