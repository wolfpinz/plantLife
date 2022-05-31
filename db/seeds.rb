# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'
# seed
# 1 user
User.destroy_all
puts "All Users destroyed"
Garden.destroy_all
puts "All Gardens destroyed"
MyPlant.destroy_all
puts "All MyPlants destroyed"
Plant.destroy_all
puts "All Plants destroyed"
Action.destroy_all
puts "All Actions destroyed"
# Plants Scraper
url = "https://pfaf.org/user/Plant.aspx?LatinName=Monstera+deliciosa"
html = URI.open(url)
doc = Nokogiri::HTML(html)
p doc.search("#ContentPlaceHolder1_lblCommanName").text.strip # gets common name
p doc.search("#ContentPlaceHolder1_lblFamily").text.strip # gets species
p doc.search("#ContentPlaceHolder1_lbldisplatinname").text.strip # gets scientific name
doc.search("#ContentPlaceHolder1_tblIcons img").each do |element|
  p  element.attribute("alt").value
end
#   t.string "species"#
# t.string "common_name"#
# t.string "scientific_name"#
# t.string "water"
# t.string "soil"
# t.string "sun"
# t.string "temperature"


# user = User.new(
#   first_name: "Wolf",
#   last_name: "Pinz",
#   email: "wolf@me.com",
#   password: "123456"
# )
# user.save!
# # 1 garden
# garden = Garden.new(
#   name: "My Garden",
#   user: user
# )
# garden.save

# 1 plants
# .string "species"
#     t.string "common_name"
#     t.string "scientific_name"
#     t.string "water"
#     t.string "soil"
#     t.string "sun"
#     t.string "temperature"
# plant1 = Plant.new(
#   species: "Kaktus",
#   common_name: "Monstera",
#   scientific_name: "Monstera whatever",
#   water: "viel",
#   soil: "gut",
#   sun: "geht",
#   temperature: "40"
# )

# plant2 = Plant.new(
#   species: "Baum",
#   common_name: "Ficus",
#   scientific_name: "Fikkifickus",
#   water: "sehr viel",
#   soil: "braun",
#   sun: "geht",
#   temperature: "41"
# )
# plant1.save
# plant2.save

# 2 my_plants

# my_plant1 = MyPlant.new(
#   nickname: "Peter",
#   light_exposure: "doll",
#   garden: garden,
#   plant: plant1
# )
# my_plant2 = MyPlant.new(
#   nickname: "Frank",
#   light_exposure: "geht so",
#   garden: garden,
#   plant: plant2
# )
# my_plant1.save
# my_plant2.save

# 1 action
# action = Action.new(
#   user: user,
#   my_plant: my_plant1,
#   action_type: "water this bitch",
#   frequency: 7,
#   date: Date.today
# )
# action.save
