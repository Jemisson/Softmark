class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :description
      t.integer :maxTemp
      t.integer :minTemp

      t.timestamps null: false
    end
  end
end
