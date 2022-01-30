# frozen_string_literal: true

class CreateQrcodes < ActiveRecord::Migration[4.2]
  def change
    create_table :qrcodes do |t|
      t.datetime :date_time
      t.integer :validity
      t.string :value
      t.string :client
      t.string :img_path
      t.string :token

      t.timestamps null: false
    end
  end
end
