# frozen_string_literal: true

class Admin < ApplicationRecord

  # Constants
  ROLES = { full_access: 0, restricted_access: 1 }.freeze
  # Enums
  enum role: ROLES

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
