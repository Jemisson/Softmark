# frozen_string_literal: true

class Advertising < ApplicationRecord

  belongs_to :category
  belongs_to :weather
  belongs_to :qrcode
  belongs_to :client, counter_cache: true

  validates :picture, presence: true

  has_attached_file :picture,
                    url: '/system/:attachment/:id/:style/:filename',
                    path: ':rails_root/public/system/:attachment/:id/:style/:filename',
                    storage: :filesystem,
                    styles: { large: '1280x720>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :picture, content_type: %r{\Aimage/.*\z}

end
