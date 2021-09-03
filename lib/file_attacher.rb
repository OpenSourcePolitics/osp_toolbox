# frozen_string_literal: true

# This module creates a file from response data
module FileAttacher
  def self.write_file(response, name_prefix, extension)
    filename = "#{name_prefix}_#{random_string}.#{extension}"
    File.open(Rails.root.join("tmp", filename), "wb") { |f| f.write(response) }

    filename
  end

  def self.delete_temp_file(filename)
    file = Rails.root.join("tmp", filename)
    File.delete(file) if File.exists? file
  end

  def self.build_and_attach_file(model:, attached_to:, data:, name_prefix:, extension:)
    filename = write_file(data, name_prefix, extension)

    storage = model.send(attached_to)

    storage.attach(
        io: File.open(Rails.root.join("tmp", filename)),
        filename: filename,
        content_type: "application/#{extension}"
    )

    model.save!

    delete_temp_file(filename)
  end

  def self.random_string
    @random_string ||= SecureRandom.alphanumeric(8)
  end
end
