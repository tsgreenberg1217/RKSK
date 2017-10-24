class AddLocationNameToPacks < ActiveRecord::Migration[5.1]
  def change
    add_column :packs, :location_name, :string
  end
end
