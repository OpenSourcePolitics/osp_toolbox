# frozen_string_literal: true

require "securerandom"

# Process document and build an archive with the response
class ProcessDocumentJob < ApplicationJob
  queue_as :default

  def perform(document_id)
    document = Document.find_by(id: document_id)
    return unless document

    output = DocumentInputFilesSerializer.serialize(document)
    response = RequestBuilder.send_post_request(output, URI("#{ENV.fetch('COMMENTS_MAPPING_URL', nil)}/?sorting_attribute=supports"))

    archive = Archive.find_or_create_by!(document:)

    archive.store_archive!(response)
  end
end
