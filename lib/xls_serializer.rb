# frozen_string_literal: true

require "json"
require "roo"

# This module provides methods to serialize xls data to hash
module XlsSerializer
  def self.serialize(file)
    xls = open_xls(file)
    rows = cleaned_rows(xls)
    casted_rows = cast_to_int(rows)

    casted_rows[1..].each_with_object({}).with_index { |(row, hash), index| hash[index.to_s] = parse_row(casted_rows[0], row) }
  end

  def self.parse_row(header, row)
    (0..header.length - 1).each_with_object({}) do |index, hash|
      hash[header[index]] = row[index]
    end
  end

  def self.cleaned_rows(xls)
    (xls.first_row..xls.last_row).map { |index| xls.row(index).compact_blank }
  end

  def self.cast_to_int(rows)
    rows.map { |row| row.map { |item| item.is_a?(Float) ? item.to_i : item } }
  end

  def self.open_xls(file)
    spreadsheet = ActiveStorage::Blob.service.send(:path_for, file.key)
    Roo::Spreadsheet.open(spreadsheet, extension: file.filename.extension_without_delimiter.to_sym)
  end
end
