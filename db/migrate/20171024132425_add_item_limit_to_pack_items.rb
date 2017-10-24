class AddItemLimitToPackItems < ActiveRecord::Migration[5.1]
  def change
    add_column :pack_items, :item1_id, :integer
    add_column :pack_items, :item2_id, :integer
    add_column :pack_items, :item3_id, :integer
    add_column :pack_items, :item4_id, :integer
    remove_column :pack_items, :item_id, :integer
  
  end
end
