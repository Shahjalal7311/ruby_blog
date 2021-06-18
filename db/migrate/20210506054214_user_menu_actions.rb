class UserMenuActions < ActiveRecord::Migration[6.1]
  def up
    create_table :user_menu_actions do |t|
      t.integer      :user_menu_id, null: true
      t.integer      :menuType, null: true
      t.string       :actionName, limit:255, null: true
      t.string       :actionLink, limit:255, null: true
      t.integer      :orderBy,null: true
      t.integer      :actionStatus, limit:1, default: 1, null: true
      t.timestamps
    end
  end

  def down
    drop_table :user_menu_actions
  end
end
