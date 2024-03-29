# frozen_string_literal: true

# This module creates a file from response data
module FileAttacher
  def self.write_file(response, name_prefix, extension)
    filename = "#{name_prefix}_#{random_string}.#{extension}"
    path = Rails.root.join("tmp", filename)
    File.binwrite(path, response)

    filename
  end

  def self.delete_tmp_file(filename)
    path = Rails.root.join("tmp", filename)
    FileUtils.rm_f(path)

    !File.exist?(path)
  end

  def self.build_and_attach_file(model:, attached_to:, data:, name_prefix:, extension:)
    filename = write_file(data, name_prefix, extension)
    storage = model.send(attached_to)
    path = Rails.root.join("tmp", filename)

    storage.attach(
      io: File.open(path),
      filename:,
      content_type: "application/#{extension}"
    )

    model.save!

    delete_tmp_file(filename)
  end

  def self.random_string
    @random_string ||= SecureRandom.alphanumeric(8)
  end
end
