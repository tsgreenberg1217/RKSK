class AddForeignKeysToPacks < ActiveRecord::Migration[5.1]
  def change
    add_column :packs, :user_id, :integer
    add_column :packs, :location_id, :integer
  end
end
