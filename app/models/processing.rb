# frozen_string_literal: true

# Model for preprocessing file
class Processing < ApplicationRecord
  ANALYSISES = [:wordclouds, :ldb]
  after_commit :preprocess_data, if: -> { sent_to_preprocessing_at.nil? }
  has_one_attached :file
  has_one_attached :preprocessed_file_data
  has_many :analyses, dependent: :destroy
  validates :file, attached: true, content_type: %w[text/csv application/vnd.ms-excel]

  scope :processed, -> { joins(:preprocessed_file_data_attachment) }

  def preprocess_data
    PreprocessingJob.perform_later(self)
  end

  def token_to_check_against
    file.checksum
  end

  def self.store_preprocessing_data!(preprocessing, data)
    FileAttacher.attach_file(
        preprocessing,
        :preprocessed_file_data,
        PreprocessingSerializer.parse_response(data),
        "preprocessed_file_data",
        "json"
    )

    preprocessing.update!(preprocessed_at: Time.current)

    AnalysisesJob.perform_later(preprocessing)
  end

  def preprocessed_data
    JSON.parse(preprocessed_file_data.download)
  end
end
