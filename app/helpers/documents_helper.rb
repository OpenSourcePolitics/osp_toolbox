module DocumentsHelper
  def document_archive_for(document)
    if document.archive && document.archive.file.present?
      link_to "Download #{document.archive.file.name}",
              rails_blob_path(document.archive.file,
                              disposition: "attachment")

    else
      "No available archive"
    end
  end
end
