class User < ApplicationRecord
  has_secure_password

  has_many :packs
  has_many :pack_items, through: :packs
  has_many :items, through: :pack_items
end
