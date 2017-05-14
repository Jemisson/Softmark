class Advertising < ActiveRecord::Base
  belongs_to :category
  belongs_to :weather
  belongs_to :qrcode
  belongs_to :client, counter_cache: true

  validates_presence_of :picture

  has_attached_file :picture, styles: { large:"1920x1080#", thumb: "100x100>" },
                                      default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/



end
