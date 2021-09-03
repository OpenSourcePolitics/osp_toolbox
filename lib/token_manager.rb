# frozen_string_literal: true

require "digest"

# Provides methods to build and verify token
module TokenManager
  def self.generate_token(string)
    Digest::SHA2.hexdigest "#{Rails.application.secret_key_base}_#{string}"
  end

  def self.valid_token?(string, token)
    generate_token(string) == token
  end
end
