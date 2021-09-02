# frozen_string_literal: true

require "securerandom"

# Process document and build an archive with the response
class ProcessDocumentJob < ApplicationJob
  queue_as :default

  def perform(document)
    output = DocumentInputFilesSerializer.serialize(document)
    response = RequestBuilder.send_post_request(output, URI("#{ENV['COMMENTS_MAPPING_URL']}/?sorting_attribute=supports"))

    archive = Archive.find_or_create_by!(document: document)

    FileAttacher.attach_file(archive, :file, response, "comments_mapping_archive", "zip")
  end
end
