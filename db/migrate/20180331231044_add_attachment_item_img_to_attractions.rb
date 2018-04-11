class AddAttachmentItemImgToAttractions < ActiveRecord::Migration[5.1]
  def up
    change_table :attractions do |t|
      t.attachment :item_img
    end
  end

  def down
    remove_attachment :attractions, :item_img
  end
end
