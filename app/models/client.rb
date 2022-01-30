# frozen_string_literal: true

class Client < ActiveRecord::Base
  # Associations
  has_many :advertisings
end
