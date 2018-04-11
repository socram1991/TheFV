class AddUserIdToAttractions < ActiveRecord::Migration[5.1]
  def change
    add_column :attractions, :user_id, :integer
  end
end
