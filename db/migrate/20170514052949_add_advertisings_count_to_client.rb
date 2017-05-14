class AddAdvertisingsCountToClient < ActiveRecord::Migration
  def change
    add_column :clients, :advertisings_count, :integer, default: 0
  end
end
