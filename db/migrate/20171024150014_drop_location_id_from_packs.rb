class DropLocationIdFromPacks < ActiveRecord::Migration[5.1]
  def change
    remove_column :packs, :location_id, :integer
  end
end
