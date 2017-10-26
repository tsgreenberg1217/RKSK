class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: :true
  has_many :packs
  has_many :pack_items, through: :packs
  has_many :items, through: :pack_items
end
