require 'json'
require 'roo'

module XlsSerializer
  def self.serialize(file)
    spreadsheet = ActiveStorage::Blob.service.send(:path_for, file.key)
    xls = Roo::Spreadsheet.open(spreadsheet, extension: file.filename.extension_without_delimiter.to_sym)

    rows = (xls.first_row..xls.last_row).map { |index| xls.row(index).reject(&:blank?) }
    casted_rows = rows.map { |row| row.map { |item| item.is_a?(Float) ? item.to_i : item } }
    header = casted_rows[0]
    content = casted_rows[1..-1]

    content.each_with_object({}).with_index { |(row, hash), index| hash[index.to_s] = parse_row(header, row) }
  end

  def self.parse_row(header, row)
    (0..header.length - 1).each_with_object({}) do |index, hash|
      hash[header[index]] = row[index]
    end
  end
end