# frozen_string_literal: true

# Helper for documents
module DocumentsHelper
  def document_archive_for(document)
    if document.archive && document.archive.file.present?
      link_to t("download", filename: document.archive.file.name, scope: "documents_helper.document_archive_for"),
              rails_blob_path(document.archive.file, disposition: "attachment"),
              class: "btn btn-outline-success"

    else
      t("no_available_archive", scope: "documents_helper.document_archive_for")
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
