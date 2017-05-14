class Category < ActiveRecord::Base

  # Associations
  has_many :advertisings

  #validations
  validates_presence_of :description
end
