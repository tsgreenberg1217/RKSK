class Item < ApplicationRecord
  has_many :pack_items
  has_many :packs, through: :pack_items
  has_many :users, through: :packs

  # Inputs from the API should be sanitized here

  def self.new_from_api(item_hash)
    #byebug
    #item_hash = item_hash[0
    title = (item_hash["title"]).gsub(/[~`*,']/, ' ')
    price = item_hash["price"]
    description = item_hash["description"].gsub("\n",'')
    url = item_hash["url"]
    image = item_hash["Images"][0]["url_170x135"]
    item = Item.create(title: title, price: price, description: description, url: url, image: image)
    return item
    # item.save

  end
  def self.destroy_no_pack_items
    @items = Item.all
    @items.each do |item|
      if item.packs.empty? == true
        item.destroy
      end
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
end
end
