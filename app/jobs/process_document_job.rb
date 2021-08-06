require 'securerandom'

class ProcessDocumentJob < ApplicationJob
  queue_as :default

  def perform(document)
    output = DocumentInputFilesSerializer.serialize(document)
    response = CommentsMappingRequest.send_post_request(output)

    DocumentArchiveWriter.write_archive_file(document, response)
  end
end