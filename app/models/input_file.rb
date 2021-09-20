# frozen_string_literal: true

# Intput file stores a file to be used with documents
class InputFile < ApplicationRecord
  has_one_attached :file
  belongs_to :document
  after_commit :trigger_archive_processing

  validates :file, attached: true, content_type: "text/csv"
  validate :only_one_file_by_type

  def only_one_file_by_type
    return true unless document.input_files.map(&:typename).include?(typename)

    errors.add(:base, "A document from #{typename} type has already been uploaded")
  end

  def trigger_archive_processing
    self.document.process_archive
  end
end
