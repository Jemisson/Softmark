# frozen_string_literal: true

class AddMillisecToClient < ActiveRecord::Migration[4.2]
  def change
    add_column :clients, :millisec, :integer
  end
end
