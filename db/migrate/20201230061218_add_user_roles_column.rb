class AddUserRolesColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_roles_id, :integer
  end
end
