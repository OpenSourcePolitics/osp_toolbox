module DocumentArchiveWriter
  def self.write_archive_file(document, response)
    archive_filename = "archive_#{random_string}.zip"

    File.open(Rails.root.join("tmp", archive_filename), "wb") do |f|
      f.write(response.read_body)
    end
    document_archive = Archive.find_or_create_by!(document: document)

    document_archive.file.attach(
      io: File.open(Rails.root.join("tmp", archive_filename)),
      filename: archive_filename,
      content_type: 'application/zip'
    )

    document_archive.save
  end

  private

  def self.random_string
    @random_string ||= SecureRandom.alphanumeric(8)
  end
end