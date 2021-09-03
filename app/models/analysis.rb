class Analysis < ApplicationRecord
  belongs_to :processing
  has_one_attached :file

  def self.store_analysis_data!(analysis, data)
    FileAttacher.attach_file(analysis, :file, data, analysis.typename, analysis.detect_extension)

    analysis.save!
  end

  def token_to_check_against
    "#{typename}_#{processing.preprocessed_file_data.checksum}"
  end

  def detect_extension
    if typename == "wordclouds"
      "png"
    else
      "xlsx"
    end
  end
end
