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

  def string_to_generate_token
    file.checksum
  end

  def store_preprocessing_data!(data)
    FileAttacher.build_and_attach_file(
        model: self,
        attached_to: :preprocessed_file_data,
        data: PreprocessingSerializer.parse_response(data),
        name_prefix: "preprocessed_file_data",
        extension: "json"
    )

    self.update!(preprocessed_at: Time.current)

    AnalysisesJob.perform_later(self)
  end

  def preprocessed_data
    JSON.parse(preprocessed_file_data.download)
  end
end
