class Location < ApplicationRecord
  has_many :packs
  has_many :users, through: :packs
  has_many :pack_items, through: :packs
  has_many :items, through: :pack_items
end
