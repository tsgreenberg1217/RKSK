# get 20 items for each?
# get a list of all the descriptions that the weather api could possibly return and think of a few keywords for each?

# Make a table with weather conditions mapped to search terms
# When the weather algorithm is run, it selects all the rows that match those conditions, picks 10 at random and hits the API to get 2 of each of those. Returns that result to the user, who can pick 4 to persist.

weather_hash = {

cold:["whiskey","parka","tea","gloves","pipe","crochet","polar bear","sweater","icicle","indoor","candle","cashmere","wool","igloo","snowflake","hat","scarf","sweater","soup","zine","boots","autumn","pumpkin spice","flannel","cocktail","museum","hibernation","flask","fireplace","hockey"],

temperate:["spring", "flowers", "picnic", "wine", "lavender", "craft beer", "fishing", "salad", "mountain", "hiking", "sneakers", "bicycle", "lunchbox", "denim", "t-shirt", "camping", "cabin", "bonfire", "gardening", "baseball","tennis","golf","yoga"],

hot:["beach", "tropical", "flip flops", "flamingo", "linen", "sand", "ice cream", "beach towel", "lemonade", "festival", "watermelon", "refreshing", "popsicle", "tank top", "swim suit","desert","swimming", "shorts"],

cloudy:["cloud", "gray", "black and white photo"],

rainy: ["rain", "umbrella", "raincoat", "rain boots", "rain stick", "rain drop"],

sunny: ["sunglasses", "visor", "sunscreen", "happiness"],

stormy: ["thunder" "dark and stormy", "emo", "noah's ark"]

}

## To seed data into a weather table
#
# weather_hash.each do |description,keywords_ary|
#   keywords_ary.each do |keyword|
#     Weather.create(keyword: keyword, description: description)
#   end
# end


## OR To seed data directly from API with a keyword

ItemAdapter.import(weather_hash[:cold])
ItemAdapter.import(weather_hash[:temperate])
ItemAdapter.import(weather_hash[:hot])

User.create(name: 'Todd', username: 'tsg')
