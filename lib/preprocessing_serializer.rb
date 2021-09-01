# frozen_string_literal: true

require "csv"
require "json"

# This module redirects to the appropriate serializer
module PreprocessingSerializer
  def self.serialize(preprocessing)
    if preprocessing.file.filename.extension_without_delimiter == "csv"
      CsvSerializer.serialize(preprocessing.file.download)
    else
      XlsSerializer.serialize(preprocessing.file)
    end
  end
end
