class Analysis < ApplicationRecord
  belongs_to :processing
  has_one_attached :file

  def store_analysis_data!(data)
    FileAttacher.build_and_attach_file(
        model: self,
        attached_to: :file,
        data: data,
        name_prefix: self.typename,
        extension: self.detect_extension
    )

    self.save!
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
