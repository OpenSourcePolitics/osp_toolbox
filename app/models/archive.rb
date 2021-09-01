# frozen_string_literal: true

class Archive < ApplicationRecord
  belongs_to :document
  has_one_attached :file
end
