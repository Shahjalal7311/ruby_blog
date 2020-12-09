class UserRoles < ActiveRecord::Migration[5.2]
  def up
    create_table :user_roles do |t|
      t.string       :name, limit:255, null: true
      t.integer      :menuType, null: true
      t.text         :permission, null: true
      t.text         :actionPermission, null: true
      t.integer      :status, limit: 1, default: 1, null: true
      t.timestamps
    end
  end

  def down
    drop_table :user_roles
  end
end
