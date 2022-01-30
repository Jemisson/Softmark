# frozen_string_literal: true

class AddAdvertisingsCountToClient < ActiveRecord::Migration[4.2]

  def change
    add_column :clients, :advertisings_count, :integer, default: 0
  end

end
