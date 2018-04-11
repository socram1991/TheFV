class AddCategoryIdToAttractions < ActiveRecord::Migration[5.1]
  def change
    add_column :attractions, :category_id, :integer
  end
end
