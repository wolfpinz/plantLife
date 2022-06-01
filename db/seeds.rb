# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'
require 'rest-client'
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
# url = "https://pfaf.org/user/Plant.aspx?LatinName=Monstera+deliciosa"
# html = URI.open(url)
# doc = Nokogiri::HTML(html)
# p doc.search("#ContentPlaceHolder1_lblCommanName").text.strip # gets common name
# p doc.search("#ContentPlaceHolder1_lblFamily").text.strip # gets species
# p doc.search("#ContentPlaceHolder1_lbldisplatinname").text.strip # gets scientific name
# doc.search("#ContentPlaceHolder1_tblIcons img").each do |element|
#   p  element.attribute("alt").value
# end

# Plant API
# def plant_api_data
#   ENV["plant_api"]
# end
# api_data = { key: plant_api_data }
response = RestClient.get('https://open.plantbook.io/api/v1/plant/search?alias=acanthus%20ilicifolius', {:Authorization => "Bearer F82ipHGEZmEhMpJPsJLIIZsbIP1oTU"}) # bearer private? alias=user imput ?
# p response.body
pid = JSON.parse(response)["results"].first["pid"].gsub(' ', '%20') # (' ', '%20') <== ersetzen des leerzeichens mit den richtigen url syntax
plant_hash = RestClient.get("https://open.plantbook.io/api/v1/plant/detail/#{pid}/", {:Authorization => "Bearer F82ipHGEZmEhMpJPsJLIIZsbIP1oTU"})
puts "fetching plant name..."
plant_name = JSON.parse(plant_hash)["alias"]
puts "fetching max temp..."
max_temp = JSON.parse(plant_hash)["max_temp"]
puts "fetching min temp..."
min_temp = JSON.parse(plant_hash)["min_temp"]
puts "fetching max humidity..."
max_humidity = JSON.parse(plant_hash)["max_env_humid"]
puts "fetching min humidity..."
min_humidity = JSON.parse(plant_hash)["min_env_humid"]
puts "fetching max soil moisture..."
max_soil_moist = JSON.parse(plant_hash)["max_soil_moist"]
puts "fetching min soil moisture..."
min_soil_moist = JSON.parse(plant_hash)["min_soil_moist"]
puts "fetching img url..."
image_url = JSON.parse(plant_hash)["image_url"]

# Plant.new(temperature:max_temp) <== plants atributes sav first Plants.new <== attach img then Plants.save

# all informations contained in the array
# "pid": "acanthus ilicifolius",
# "display_pid": "Acanthus ilicifolius",
# "alias": "acanthus ilicifolius",
# "max_light_mmol": 2500,
# "min_light_mmol": 1200,
# "max_light_lux": 6000,
# "min_light_lux": 1500,
# "max_temp": 32,
# "min_temp": 10,
# "max_env_humid": 80,
# "min_env_humid": 30,
# "max_soil_moist": 60,
# "min_soil_moist": 15,
# "max_soil_ec": 2000,
# "min_soil_ec": 350,
# "image_url": "https://example.com/n/sdpo/b/plant-img/o/acanthus%20ilicifolius.jpg"
