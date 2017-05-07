class Advertising < ActiveRecord::Base
  belongs_to :category
  belongs_to :weather

end
