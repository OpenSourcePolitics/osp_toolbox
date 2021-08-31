require 'csv'
require 'json'

module PreprocessingSerializer
  def self.serialize(preprocessing)
    if preprocessing.file.filename.extension_without_delimiter == "csv"
      CsvSerializer.serialize(preprocessing.file.download)
    else
      XlsSerializer.serialize(preprocessing.file)
    end
  end
end