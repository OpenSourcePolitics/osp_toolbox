# frozen_string_literal: true

require "digest"

# Provides methods to build and verify token
module TokenBuilder
  def self.generate_token(preprocessing)
    Digest::SHA2.hexdigest "#{Rails.application.secret_key_base}_#{preprocessing.file.checksum}"
  end

  def self.valid_token?(preprocessing, token)
    generate_token(preprocessing) == token
  end
end
