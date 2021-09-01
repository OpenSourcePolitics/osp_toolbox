require 'securerandom'

class ProcessDocumentJob < ApplicationJob
  queue_as :default

  def perform(document)
    output = DocumentInputFilesSerializer.serialize(document)
    response = RequestBuilder.send_post_request(output, URI("#{ENV["COMMENTS_MAPPING_URL"]}/?sorting_attribute=supports"))

    DocumentArchiveWriter.write_archive_file(document, response)
  end
end