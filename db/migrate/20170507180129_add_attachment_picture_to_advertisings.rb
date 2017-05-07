class AddAttachmentPictureToAdvertisings < ActiveRecord::Migration
  def self.up
    change_table :advertisings do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :advertisings, :picture
  end
end
