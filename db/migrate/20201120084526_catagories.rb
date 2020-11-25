class Catagories < ActiveRecord::Migration[5.2]
  def up
    create_table :catagories do |t|
      t.string      :title, null: false
      t.string      :slug
      t.text        :content, limit: 4294967295
      t.datetime    :published_at
      t.integer     :status, limit: 1, default: 0, null: false
      t.timestamps
    end
  end

  def down
    drop_table :catagories
  end
end
