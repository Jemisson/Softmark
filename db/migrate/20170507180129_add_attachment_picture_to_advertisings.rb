# frozen_string_literal: true

class AddAttachmentPictureToAdvertisings < ActiveRecord::Migration[4.2]
  def self.up
    change_table :advertisings do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :advertisings, :picture
  end
end
