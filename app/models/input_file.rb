class InputFile < ApplicationRecord
  has_one_attached :file
  belongs_to :document

  validates :file, attached: true, content_type: 'text/csv'
end
