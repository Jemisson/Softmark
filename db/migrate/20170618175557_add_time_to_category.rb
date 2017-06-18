class AddTimeToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :start_time, :time
    add_column :categories, :end_time, :time
  end
end
