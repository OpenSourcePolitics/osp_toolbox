# frozen_string_literal: true

# This module provides methods for sanitizing
module Sanitizer
  # filename: Returns a parameterize filename or timestamp if 'filename' parameter is nil or empty
  # params: filename : String
  # returns: String
  def self.filename(filename)
    return DateTime.now.to_i.to_s if filename.blank?

    filename.parameterize(separator: "_").gsub("-", "_")
  end
end
