# frozen_string_literal: true

# Document class
class Document < ApplicationRecord
  belongs_to :user
  has_many :input_files, dependent: :destroy
  has_one :archive, dependent: :destroy

  validates :title, presence: true

  def process_archive
    return unless input_files.size >= 2

    ProcessDocumentJob.perform_later(id)
  end
end
