class AddMillisecToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :millisec, :integer
  end
end
