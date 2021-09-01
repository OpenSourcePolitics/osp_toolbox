# frozen_string_literal: true

require "csv"
require "json"

# This module provides methods to serialize input files data to JSON
module DocumentInputFilesSerializer
  def self.serialize(document)
    document.input_files.each_with_object({}) do |item, hash|
      hash[item.typename] = CsvSerializer.serialize(item.file.download)
    end.as_json
  end
end
