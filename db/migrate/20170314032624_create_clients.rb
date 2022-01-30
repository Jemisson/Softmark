# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[4.2]
  def change
    create_table :clients do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
