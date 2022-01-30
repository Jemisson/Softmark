# frozen_string_literal: true

class AddNameToMember < ActiveRecord::Migration[4.2]
  def change
    add_column :members, :name, :string
  end
end
