# frozen_string_literal: true

# Model for preprocessing file
class Processing < ApplicationRecord
  after_commit :preprocess_data, if: -> { sent_to_preprocessing_at.nil? }
  has_one_attached :file
  validates :file, attached: true, content_type: %w[text/csv application/vnd.ms-excel]

  def preprocess_data
    PreprocessingJob.perform_later(self)
  end
end
