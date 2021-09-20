# frozen_string_literal: true

class Document < ApplicationRecord
  belongs_to :user
  has_many :input_files, dependent: :destroy
  has_one :archive, dependent: :destroy

  def process_archive
    return unless self.input_files.count > 2

    ProcessDocumentJob.perform_later(self)
  end
end
