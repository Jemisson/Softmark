class CreateWeathers < ActiveRecord::Migration[4.2]
  def change
    create_table :weathers do |t|
      t.string :description
      t.integer :max_temp
      t.integer :min_temp

      t.timestamps null: false
    end
  end
end
