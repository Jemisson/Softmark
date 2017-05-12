class CreateQrcodes < ActiveRecord::Migration
  def change
    create_table :qrcodes do |t|
      t.datetime :date_time
      t.integer :validity
      t.float :value
      t.string :client

      t.timestamps null: false
    end
  end
end
