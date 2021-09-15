class Analysis < ApplicationRecord
  belongs_to :processing
  has_one_attached :file

  validates :processing, presence: true

  def self.available_analyses
    [:wordclouds, :ldb]
  end

  def store_analysis_data!(data)
    FileAttacher.build_and_attach_file(
        model: self,
        attached_to: :file,
        data: data,
        name_prefix: Sanitizer.filename(self.processing&.title),
        extension: self.detect_extension
    )

    self.save!
    Notification.send("Analysis #{self.typename} for #{self.processing.title} is over.")
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
end
