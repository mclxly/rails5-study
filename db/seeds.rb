# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

food_types = ["Curry", "Dessert", "Sides","Breakfast"]
food_types.each{|d| FoodType.where(:name => d).create}

food_preferences = ["Vegetarian", "Vegan",
"Meat","Dairy"]
food_preferences.each{|d| FoodPreference.where(:name =>d).first_or_create}

cuisines = ["Italian", "Mexican", "Indian","Chinese"]
cuisines.each{|d| Cuisine.where(:name =>d).first_or_create}