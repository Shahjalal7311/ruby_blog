class Menus < ActiveRecord::Migration[6.1]
  def up
    create_table :user_menus do |t|
      t.string      :parentMenu, limit:255, null: true
      t.string      :menuName, limit:255, null: true
      t.string      :menuLink, limit:255, null: true
      t.string      :menuIcon, limit:255, null: true
      t.integer     :orderBy, null: true
      t.integer     :menuStatus,limit:1, default: 1, null: true
      t.timestamps
    end
  end

  def down
    drop_table :user_menus
  end
end
