class Pack < ApplicationRecord
  has_many :pack_items
  has_many :items, through: :pack_items
  belongs_to :user
  validate :has_four, :on => :update


  def has_four
    if self.items.count != 4
      errors.add(:items, 'must choose four items')
    end
  end


  WEATHER_HASH = {

    cold:["whiskey","parka","tea","gloves","pipe","crochet","polar bear","sweater","icicle","indoor","candle","cashmere","wool","igloo","snowflake","fur hat","scarf","sweater","soup","zine","boots","autumn","pumpkin spice","flannel","cocktail","museum","hibernation","flask","fireplace","hockey"],

    temperate:["spring", "flowers", "picnic", "wine", "lavender", "craft beer", "fishing", "salad", "mountain", "hiking", "sneakers", "bicycle", "lunchbox", "denim", "t-shirt", "camping", "cabin", "bonfire", "gardening", "baseball","tennis","golf","yoga"],

    hot:["beach", "tropical", "flip flops", "flamingo", "linen", "sand", "ice cream", "beach towel", "lemonade", "festival", "watermelon", "refreshing", "popsicle", "tank top", "swim suit","desert","swimming", "shorts","palm"],

    cloudy:["cloud", "cloud", "cloud","cloud","gray", "gray", "gray", "black and white photo","hazy","stormy"],

    rainy: ["rain", "rain", "rain", "umbrella", "umbrella", "raincoat", "raincoat", "rain boots", "rain stick", "rain drop", "raining","wet", "flood","misty","monsoon","puddle","droplet","thunder","lightning"],

    sunny: ["sunglasses", "sunglasses", "sunglasses", "baseball cap","baseball cap", "sombrero", "wide brim", "visor", "sunscreen","sunscreen", "sunscreen", "happiness", "breeze"],

    stormy: ["thunder","thunder", "dark and stormy", "emo", "noah's ark","storm","cloud","stormy","stormy","stormy","stormy","cloud", "cloud"]

  }

def self.weather_hash
  WEATHER_HASH
end

# def get_items_to_display(temp, weather_desc)
#   array = shuffle_keywords(temp, weather_desc)
#   array.collect { |word| Item.where(keyword: word).shuffle.first }.each do |item|
#   end
# end

def self.search(search)
  where("name ILIKE ? OR location_name ILIKE ? OR weather_desc ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
end

def shuffle_keywords(temp, weather_desc)
  #20 items that the user can select from that fit the temp and desc
  array = WEATHER_HASH[find_association_by_temp(temp).to_sym].concat(WEATHER_HASH[find_association_by_desc(weather_desc).to_sym])
  array.shuffle
  array[1..20]
end

def find_association_by_temp(temp)
  case
  when temp.to_i > 80
    return "hot"
  when temp.to_i >= 54 && temp.to_i <=80
    return "temperate"
  when temp.to_i < 54
    return "cold"
  end
end

def find_association_by_desc(weather_desc)
  #["cloud","overcast"].any? {|w| weather_desc.include?(w)}
  case
  when weather_desc.include?("cloud") || weather_desc.include?("overcast") || weather_desc.include?("haze")
    return "cloudy"
  when weather_desc.include?("sun")
    return "sunny"
  when weather_desc.include?("rain") || weather_desc.include?("mist")
    return "rainy"
  when weather_desc.include?("fog")
    return "stormy"
  else
    return "sunny"
  end
end
def self.search(search)
  where("name ILIKE ? OR location_name ILIKE ? OR weather_desc ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
end

end
