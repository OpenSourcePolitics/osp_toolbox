class Document < ApplicationRecord
  belongs_to :user
  has_many :input_files
  has_one :archive

  after_save :process_document, if: ->(document) { document.ready? }

  def process_document
    ProcessDocumentJob.perform_later(self)
  end
end
