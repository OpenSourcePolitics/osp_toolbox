# frozen_string_literal: true

# Analysis class
class Analysis < ApplicationRecord
  belongs_to :processing
  has_one_attached :file

  AVAILABLE_ANALYSES = %w[wordclouds ldb].freeze

  validates :processing, presence: true
  validates :typename, inclusion: { in: AVAILABLE_ANALYSES }

  def store_analysis_data!(data)
    FileAttacher.build_and_attach_file(
      model: self,
      attached_to: :file,
      data: data,
      name_prefix: Sanitizer.filename(processing&.title),
      extension: detect_extension
    )

    save!

    Notification.notify!(self)
  end

  def string_to_generate_token
    "#{typename}_#{processing.preprocessed_file_data.checksum}"
  end

  def detect_extension
    if typename == "wordclouds"
      "png"
    else
      "xlsx"
    end
  end

  def notification_message
    "Analysis #{typename} for #{processing.title} is over."
  end
end
