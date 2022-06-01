require 'open-uri'
require 'nokogiri'
require 'rest-client'

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

plant_names = [
  "monstera deliciosa",
  "ficus lyrata",
  "yucca recurvifolia",
  "cylindropuntia leptocaulis",
  "abutilon palmeri",
  "acacia farnesiana",
  "ficus lyrata",
  "angelonia angustifolia",
  "prunus triloba",
  "laurentia axillaris",
  "dryopteris bushiana",
  "stenotaphrum helferi",
  "ferocactus histrix",
  "acer campestre",
  "acer spicatum",
  "celosia plumosa",
  "dianthus plumarius",
  "prunus mume",
  "fern",
  "monstera friedrichsthalii"
]

def create_plant(url)
  plant_hash = RestClient.get(url, {:Authorization => "Bearer wET3kgA58wW7AEMlEA9R2Pcrd8bADz"})
  common_name = JSON.parse(plant_hash)["alias"]
  temperature = JSON.parse(plant_hash)["max_temp"].to_s
  light = JSON.parse(plant_hash)["max_light_lux"].to_s
  water = JSON.parse(plant_hash)["max_soil_moist"].to_s
  soil = JSON.parse(plant_hash)["max_soil_ec"].to_s
  scientific_name = JSON.parse(plant_hash)["display_pid"]
  img = JSON.parse(plant_hash)["image_url"]
  file = URI.open(img)
  p plant = Plant.new(common_name: common_name, scientific_name: scientific_name, temperature: temperature, sun: light, water: water, soil: soil)
  plant.photo.attach(io: file, filename: "img", content_type: 'image/jpg')
  p plant.save
end
plant_names.each do |p|
  url = "https://open.plantbook.io/api/v1/plant/detail/#{p}/".gsub(' ', '%20')
  create_plant(url)
end
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
