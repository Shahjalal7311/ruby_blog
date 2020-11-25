class AddColumnToCatagories < ActiveRecord::Migration[5.2]
  def change
    add_column :catagories, :users_id, :integer
  end
end
