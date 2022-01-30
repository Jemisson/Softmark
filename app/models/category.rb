# frozen_string_literal: true

class Category < ApplicationRecord

  # Associations
  has_many :advertisings

  # validations
  validates :description, presence: true

end
