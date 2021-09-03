# frozen_string_literal: true

class Archive < ApplicationRecord
  belongs_to :document
  has_one_attached :file

  def store_archive!(response)
    FileAttacher.build_and_attach_file(
        model: self,
        attached_to: :file,
        data: response.body,
        name_prefix: "comments_mapping_archive",
        extension: "zip"
    )
  end
end
