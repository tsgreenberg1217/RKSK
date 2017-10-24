
class Pack < ApplicationRecord
  has_many :pack_items
  has_many :items, through: :pack_items
  belongs_to :user

end
