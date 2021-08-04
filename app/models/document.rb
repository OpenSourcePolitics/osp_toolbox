class Document < ApplicationRecord
  belongs_to :user
  has_many :input_files
end
