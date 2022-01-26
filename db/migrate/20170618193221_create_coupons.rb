class CreateCoupons < ActiveRecord::Migration[4.2]
  def change
    create_table :coupons do |t|
      t.string :name
      t.string :phone
      t.integer :status

      t.timestamps
    end
  end
end
