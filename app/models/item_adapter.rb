class ItemAdapter < ApplicationRecord

  KEY = ENV["etsy_key"]
  # ROUTE = "https://openapi.etsy.com/v2/listings/active?api_key=#{KEY}&keywords="
  ROUTE="https://openapi.etsy.com/v2/listings/active?includes=Images(url_170x135)&fields=title,price,description,url&limit=1&api_key=#{KEY}&keywords="

  SECRET = "0jfed3h7m4"

  def self.get_route
    ROUTE
  end

  def self.get_results(keyword)
    response = RestClient.get("#{ROUTE}#{keyword}")
    JSON.parse(response)["results"][0]
    # returns an array of hashes
  end

  # call this method in the seeds file
  # we can use color in here too if we want!
  def self.import(keywords_ary)
    #  byebug
    item_array = []
    keywords_ary.each  do |keyword|
      result = get_results(keyword)
      item_array << Item.new_from_api(result)
    end
    return item_array

     # this line is an array of hashes that can be used to make new items
    # results_ary.map {|item_hash| Item.new_from_api(item_hash) }
    # this returns an array of hashes that can instantiate new item objects
  end



end
