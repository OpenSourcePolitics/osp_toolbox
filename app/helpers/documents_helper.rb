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

  def process_archive_for(document)
    return unless ready_to_process?(document)

    render partial: "process_archive_button"
  end

  def ready_to_process?(document)
    document.input_files&.count == 2
  end
end
