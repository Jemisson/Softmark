class CreateQrcodes < ActiveRecord::Migration
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
