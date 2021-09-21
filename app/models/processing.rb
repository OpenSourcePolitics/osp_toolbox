# frozen_string_literal: true

# Model for preprocessing file
class Processing < ApplicationRecord
  after_commit :preprocess_data, if: -> { sent_to_preprocessing_at.nil? }
  serialize :available_categories, Array
  has_one_attached :file
  has_one_attached :preprocessed_file_data
  has_many :analyses, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
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

    update!(available_categories: parse_categories, preprocessed_at: Time.current)

    AnalysisesJob.perform_later(self)
  end

  def preprocessed_data
    return if preprocessed_file_data.blank?

    JSON.parse(preprocessed_file_data.download)
  end

  def parse_categories
    preprocessed_data["preprocessed_data"].values.map { |row| row["category"] }.uniq.compact
  end
end
