class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :name
      t.string :phone
      t.integer :status

      t.timestamps
    end
  end
end
