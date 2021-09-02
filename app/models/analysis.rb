class Analysis < ApplicationRecord
  belongs_to :processing
  has_one_attached :file
end
