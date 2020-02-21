# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "json"

Ingredient.destroy_all

puts "creating ingredients"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = open(url).read
ingredients_parsed = JSON.parse(ingredients)
hash_of_ingredients = ingredients_parsed["drinks"]

hash_of_ingredients.each { |hash| Ingredient.create(name: hash["strIngredient1"]) }

puts "finished"
