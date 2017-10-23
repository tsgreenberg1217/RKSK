class CreatePackItems < ActiveRecord::Migration[5.1]
  def change
    create_table :pack_items do |t|
      t.integer :pack_id
      t.integer :item_id

      t.timestamps
    end
  end
end
