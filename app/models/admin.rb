class Admin < ActiveRecord::Base
  # Constants
  ROLES = {:full_access => 0, :restricted_access => 1}
  #Enums
  enum role: ROLES

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
