class AddImageAndKeywordToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :image, :string
    add_column :items, :keyword, :string
  end
end
