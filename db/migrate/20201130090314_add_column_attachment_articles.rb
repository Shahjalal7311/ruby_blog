class AddColumnAttachmentArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :attachment, :string
  end
end
