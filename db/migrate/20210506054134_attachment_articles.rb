class AttachmentArticles < ActiveRecord::Migration[6.1]

  def change
    create_table :post_attachments do |t|
      t.integer :post_id
      t.string :avatar
      t.string :attachment
      t.timestamps
    end
  end

end
