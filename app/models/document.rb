class Document < ApplicationRecord
  belongs_to :user
  has_many :input_files, dependent: :destroy
  has_one :archive, dependent: :destroy
end
