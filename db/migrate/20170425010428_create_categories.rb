# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :categories do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
