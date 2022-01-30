# frozen_string_literal: true

class AddTimeToCategory < ActiveRecord::Migration[4.2]
  def change
    add_column :categories, :start_time, :time
    add_column :categories, :end_time, :time
  end
end
