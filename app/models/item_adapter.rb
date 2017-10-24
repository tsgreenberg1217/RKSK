class ItemAdapter < ApplicationRecord

  KEY = "mxo98hn36jc699lhyusekstd"
  # ROUTE = "https://openapi.etsy.com/v2/listings/active?api_key=#{KEY}&keywords="
  ROUTE="https://openapi.etsy.com/v2/listings/active?includes=Images(url_170x135)&fields=title,price,description,url&limit=20&api_key=#{KEY}&keywords="
  SECRET = "0jfed3h7m4"

  def self.get_route
    ROUTE
  end

  def self.get_results(keyword)
    response = RestClient.get("#{ROUTE}#{keyword}")
    JSON.parse(response)["results"]
    # returns an array of hashes
  end

  # call this method in the seeds file
  # we can use color in here too if we want!
  def self.import(keywords_ary)
    keywords_ary.each do |keyword|
      item_ary = ItemAdapter.get_results(keyword)
      item_ary.each do |item_hash|
        item = Item.new
        item.title = item_hash["title"]
        item.price = item_hash["price"]
        item.description = item_hash["description"]
        item.url = item_hash["url"]
        item.image = item_hash["Images"][0]["url_170x135"]
        item.keyword = keyword
        item.save
      end
    end
  end



end
