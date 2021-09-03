# frozen_string_literal: true

require "digest"

# Provides methods to build and verify token
module TokenBuilder
  def self.generate_token(file)
    Digest::SHA2.hexdigest "#{Rails.application.secret_key_base}_#{file.checksum}"
  end

  def self.valid_token?(file, token)
    generate_token(file) == token
  end
end
