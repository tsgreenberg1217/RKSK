## RKSK

_It's pronounced "rucksack" ;)_
Source for quirky items to buy for a vacation based on the destination’s climate. Users can log in to create a pack of items for their trip, as well as search and view other users' packs. Weather from the [World Weather Online API](https://developer.worldweatheronline.com/api/) and items sourced from the [Etsy API](https://www.etsy.com/developers/).

## Key Technologies, Packages, and Gems

* Front End
  * Ruby on Rails
  * Material UI
* Back End
  * Rails
  * User login authentication with bcrypt
  * Postgres database

## Core Features

* Create a pack of items for a trip based on the destination's API-generated weather
* Search other users' packs by location, keyword, or weather
* View other users' previously created packs
* User can delete own packs
* Total value of each pack calculated based on Etsy prices
* Individual items link out to their respective Etsy listings

## Demo

[View live demo here](https://rksk.herokuapp.com/login)

![rksk login](https://media.giphy.com/media/3oFzmeXuqLVN2zEDcc/giphy.gif)

Users choose a username and password to create an account.

 <br />

![create pack](https://media.giphy.com/media/3ohc0TNwuR0JEWyG6k/giphy.gif)

Search for a city by name to view a list of items relevant to that city's current weather.

  <br />

![select items](https://media.giphy.com/media/3ohc181vEjwQXfJl6g/giphy.gif)

Select items for that trip's pack and customize the pack's name.

  <br />

![view on etsy](https://media.giphy.com/media/l1IBhFlmmtL8tW4vK/giphy.gif)

View original item listings on Etsy and the total cost to purchase the pack based on Etsy's prices.

  <br />

![search packs](https://media.giphy.com/media/xULW8CIzq58a7JD0s0/giphy.gif)

Search for other users' packs by location or weather.

  <br />

![delete pack](https://media.giphy.com/media/xULW8JEPQ3e4vkPhJe/giphy.gif)

Users can view and delete packs they've created.
