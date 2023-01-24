# frozen_string_literal: true

# Analysis class
class Analysis < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :processing
  has_one_attached :file

  AVAILABLE_ANALYSES = %w[wordclouds ldb].freeze

  validates :typename, inclusion: { in: AVAILABLE_ANALYSES }

  def store_analysis_data!(data)
    FileAttacher.build_and_attach_file(
      model: self,
      attached_to: :file,
      data:,
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
    {
      text: I18n.t("notification_message", scope: "analysis", typename:, title: processing.title),
      link: processing_analysis_url(processing_id: processing, id: self)
    }
  end
end
