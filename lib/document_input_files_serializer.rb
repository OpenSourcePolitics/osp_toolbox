require 'csv'
require 'json'

module DocumentInputFilesSerializer
  def self.serialize(document)
    document.input_files.each_with_object({}) do |item, hash|
      hash[item.typename] = parse_csv(item.file.download)
    end.as_json
  end

  private

  def self.parse_csv(data)
    csv = CSV.parse(data.force_encoding("utf-8"), col_sep: "\,")
    csv_header = csv[0]
    csv_content = csv[1..-1]
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
    if columns_to_cast_to_int.include? header_element
      row_element = row_element.to_i
    end
    return row_element
  end

end