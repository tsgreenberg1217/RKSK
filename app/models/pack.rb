
class Pack < ApplicationRecord
  has_many :pack_items
  has_many :items, through: :pack_items
  belongs_to :user

  weather_hash = {

  cold:["whiskey","parka","tea","gloves","pipe","crochet","polar bear","sweater","icicle","indoor","candle","cashmere","wool","igloo","snowflake","hat","scarf","sweater","soup","zine","boots","autumn","pumpkin spice","flannel","cocktail","museum","hibernation","flask","fireplace","hockey"],

  temperate:["spring", "flowers", "picnic", "wine", "lavender", "craft beer", "fishing", "salad", "mountain", "hiking", "sneakers", "bicycle", "lunchbox", "denim", "t-shirt", "camping", "cabin", "bonfire", "gardening", "baseball","tennis","golf","yoga"],

  hot:["beach", "tropical", "flip flops", "flamingo", "linen", "sand", "ice cream", "beach towel", "lemonade", "festival", "watermelon", "refreshing", "popsicle", "tank top", "swim suit","desert","swimming", "shorts"],

  cloudy:["cloud", "gray", "black and white photo"],

  rainy: ["rain", "umbrella", "raincoat", "rain boots", "rain stick", "rain drop"],

  sunny: ["sunglasses", "visor", "sunscreen", "happiness"],

  stormy: ["thunder" "dark and stormy", "emo", "noah's ark"]

  }

def find_items_to_display(temperature, weather_desc)
  #20 items that the user can select from that fit the temp and description
end

def find_association_by_temperature(temp)
  case
  when temp > 82
    return "hot"
  when temp >= 55 && temp <=82
    return "temperate"
  when temp < 55
    return "cold"
  end
end

def find_association_by_description(weather_desc)
  case
  when condition

  end
end

end
