class Advertising < ActiveRecord::Base
  belongs_to :category
  belongs_to :weather
  belongs_to :user
  # Validates
  validates :client, :finishDate, :startDate, :category, :weather, presence: true
  validates :user, :status, presence: true
  # Constants
  STATUS = {:active => 0, :inactive => 1}
  # Enums
  enum status: STATUS

end
