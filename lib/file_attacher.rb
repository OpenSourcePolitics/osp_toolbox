# frozen_string_literal: true

# This module creates a file from response data
module FileAttacher
  def self.write_file(response, name_prefix, extension)
    filename = "#{name_prefix}_#{random_string}.#{extension}"
    File.open(Rails.root.join("tmp", filename), "wb") { |f| f.write(response.body) }

    filename
  end

  def self.attach_file(model, attached_to, response, name_prefix, extension)
    filename = write_file(response, name_prefix, extension)

    storage = model.send(attached_to)

    storage.attach(
        io: File.open(Rails.root.join("tmp", filename)),
        filename: filename,
        content_type: "application/#{extension}"
    )

    model.save
  end

  def self.random_string
    @random_string ||= SecureRandom.alphanumeric(8)
  end
end
