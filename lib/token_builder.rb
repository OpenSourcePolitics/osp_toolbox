require 'digest'

module TokenBuilder
  def self.generate_token(preprocessing)
    Digest::SHA2.hexdigest "#{Rails.application.secret_key_base}_#{preprocessing.file.checksum}"
  end
end