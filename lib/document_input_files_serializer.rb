require 'csv'
require 'json'

module DocumentInputFilesSerializer
  def self.serialize(document)
    document.input_files.each_with_object({}) do |item, hash|
      hash[item.typename] = CsvSerializer.serialize(item.file.download)
    end.as_json
  end
end