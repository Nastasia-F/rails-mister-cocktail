# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts 'Cleaning database...'
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks_serialized = open(url).read
list_drinks = JSON.parse(drinks_serialized)
my_drinks = list_drinks['drinks']

puts 'Create your drinks..'

ingredients = []
my_drinks.each do |drink|
  ingredients << drink['strIngredient1']
end
ingredients.first(10).each do |ingredient|
  Ingredient.create(name: ingredient)
end

puts 'Finished!'
