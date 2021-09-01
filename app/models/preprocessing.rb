# frozen_string_literal: true

# Model for preprocessing file
class Preprocessing < ApplicationRecord
  has_one_attached :file

  after_save :preprocess_data

  validates :file, attached: true, content_type: %w[text/csv application/vnd.ms-excel]

  def preprocess_data
    PreprocessingJob.perform_later(self)
  end
end
