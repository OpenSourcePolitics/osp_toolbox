class InputFile < ApplicationRecord
  has_one_attached :file
  belongs_to :document

  validates :file, attached: true, content_type: 'text/csv'
  validate :only_one_file_by_type


  def only_one_file_by_type
    return true unless self.document.input_files.map(&:typename).include?(self.typename)

    errors.add(:base, "A document from #{self.typename} type has already been uploaded")
  end
end
