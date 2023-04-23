class RemoveNameFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :name, :string
    remove_column :admins, :description, :text
    remove_column :admins, :price, :integer
    remove_column :admins, :is_active, :boolean
  end
end
