class AddTempAndDescToPacks < ActiveRecord::Migration[5.1]
  def change
    add_column :packs, :temp_f, :integer
    add_column :packs, :weather_desc, :string
  end
end
