# frozen_string_literal: true

# This module provides methods for sanitizing
module Sanitizer
  # filename: Returns a parameterize filename or timestamp if 'filename' parameter is nil or empty
  # params: filename : String
  # returns: String
  def self.filename(filename)
    return "#{DateTime.now.to_i}" if filename.blank?
    filename.gsub!('-', '_') if filename.include? "-"

    filename.parameterize(separator: "_")
  end
end
