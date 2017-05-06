class CreateAdvertisings < ActiveRecord::Migration
  def change
    create_table :advertisings do |t|
      t.string :client
      t.date :finishDate
      t.date :startDate
      t.integer :status
      t.references :category, index: true, foreign_key: true
      t.references :weather, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
