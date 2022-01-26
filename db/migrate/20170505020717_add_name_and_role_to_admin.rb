class AddNameAndRoleToAdmin < ActiveRecord::Migration[4.2]
  def change
    add_column :admins, :name, :string
    add_column :admins, :role, :integer
  end
end
