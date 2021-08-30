class InputFile < ApplicationRecord
  has_one_attached :file
  belongs_to :document
end
