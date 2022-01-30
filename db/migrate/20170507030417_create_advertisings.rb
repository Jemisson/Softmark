# frozen_string_literal: true

class CreateAdvertisings < ActiveRecord::Migration[4.2]
  def change
    create_table :advertisings do |t|
      t.date :start_date
      t.date :end_date
      t.references :category, index: true, foreign_key: true
      t.references :weather, index: true, foreign_key: true
      t.references :qrcode, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
