class Item < ApplicationRecord
  has_many :pack_items
  has_many :packs, through: :pack_items
  has_many :users, through: :packs

  # Inputs from the API should be sanitized here

  def self.new_from_api(item_hash)
    #byebug
    #item_hash = item_hash[0]
    item = Item.new
    item.title = (item_hash["title"])
    item.price = item_hash["price"]
    item.description = item_hash["description"].gsub("\n",'')
    item.url = item_hash["url"]
    item.image = item_hash["Images"][0]["url_170x135"]
    item.save
  end

  # def self.new_hash_from_api(item_hash)
  #   #byebug
  #   item = {}
  #   item[:title] = (item_hash["title"])
  #   item[:price] = item_hash["price"]
  #   item[:description] = item_hash["description"].gsub("\n",'')
  #   item[:url] = item_hash["url"]
  #   item[:image] = item_hash["Images"][0]["url_170x135"]
  #   item
  # end

end
