require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)
user['drinks'].each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
end
