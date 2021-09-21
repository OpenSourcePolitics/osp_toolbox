# frozen_string_literal: true

# Archive class
class Archive < ApplicationRecord
  belongs_to :document
  has_one_attached :file

  def store_archive!(response)
    FileAttacher.build_and_attach_file(
      model: self,
      attached_to: :file,
      data: response.body,
      name_prefix: Sanitizer.filename(document&.title),
      extension: "zip"
    )
  end
end
