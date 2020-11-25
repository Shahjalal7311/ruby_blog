class AddCatagoriesIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :catagories_id, :integer
  end
end
