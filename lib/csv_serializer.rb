# frozen_string_literal: true

require "csv"
require "json"

# This module provides methods for csv serialization
module CsvSerializer
  def self.serialize(data)
    parse_csv(data).as_json
  end

  def self.detect_colum_separator(data)
    (data[2]).to_s
  end

  def self.parse_csv(data)
    csv = CSV.parse(data.force_encoding("utf-8"), col_sep: detect_colum_separator(data))
    csv_header = csv[0]
    csv_content = csv[1..]
    csv_content.each_with_object({})
               .with_index { |(row, hash), index| hash[index.to_s] = parse_row(csv_header, row) }
  end

  def self.parse_row(header, row)
    (0..header.length - 1).each_with_object({}) do |index, hash|
      row_element = correct_row_type_assessments(header[index], row[index])
      hash[header[index]] = row_element
    end
  end

  def self.correct_row_type_assessments(header_element, row_element)
    columns_to_cast_to_int = %w[id depth commentable_id endorsements/total_count endorsements comments]
    row_element = row_element.to_i if columns_to_cast_to_int.include? header_element
    row_element
  end
end
