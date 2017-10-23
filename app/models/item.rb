class Item < ApplicationRecord
  has_many :pack_items
  has_many :packs, through: :pack_items
  has_many :locations, through: :packs
  has_many :users, through: :packs
end
