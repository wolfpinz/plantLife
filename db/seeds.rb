require "open-uri"
# require 'random_name_generator'
# require "nokogiri"
# creates a user
puts 'Cleaning user database...'
User.destroy_all
User.create(email: "test@test.net", first_name: "bob", last_name: "hogen", password: "AaBb14421")
# scraper!
# house_url = "https://www.fantasynamegenerators.com/house-descriptions.php"
# html = URI.open(house_url)
# doc = Nokogiri::HTML(html)
# doc.search("#")
# result = doc.search("#").text.strip
# p result
uris = [
  'https://www.thehousedesigners.com/images/plans/UDC/bulk/8500/1569588_0.jpg',
  'https://images.all-free-download.com/images/graphiclarge/villa_mouse_franz_keller_house_rest_house_272121.jpg',
  'https://i.pinimg.com/originals/a7/2a/b0/a72ab047c5a83c69cf8509e61349b385.jpg',
  'https://res.cloudinary.com/sagacity/image/upload/c_crop,h_749,w_1000,x_0,y_0/c_limit,f_auto,fl_lossy,q_80,w_1080/Colonial_Heights_Residence_hrmww7.jpg',
  'https://images.squarespace-cdn.com/content/v1/5192bddce4b0b5a13a611a33/1414713472251-WAD5OY5PXA8YXHE1JF96/567MartisCampExt01.jpg',
  'https://i.pinimg.com/originals/45/3f/79/453f79f8d68b1724b6083f8a2d358c1c.jpg',
  'https://assets.jlscontent.com/photos/wanwmls/156/746/1567467.jpg'
]

# price_random = rand(200..3000)
flat_names = [
  'MarAlto - La Tagua 431',
  'Villa Luna im Sumberkima Hill Retreat 181',
  'Waldhafen 27',
  'WonderINN 42',
  'Container Suite 12',
  'Skylark Cabin - Ben Ohau Private Luxury Escape 1076',
  'Magazin Cover Boho Moderne Villa @ Costa Azul Surf 11'
]

flat_description = [
  'This cottage is located in the Lagunillas area, and has an unbeatable view. Built on stilts, its large windows.',
  'Sumberkima is a seaside village next to Pemuteran close to Menjangan Island, diving and snorkeling paradise.',
  'Sip a refreshing glass of the natural spring water.',
  'Immerse yourself in the wilderness, still within reach of civilization!',
  'Uno scrigno sofisticato, accogliente, immerso nella natura e dall inconfondibile stile.',
  'Skylark Cabin is a private, luxury escape, nestled serenely within the awe inspiring landscape of Ben Ohau.',
  '4 bedroom, 4.5 bathroom modern Baja home in San Jose del Cabo designed by award-winning architect, Javier Campos.'
]

# end

# fun little name generator
# flatrng = RandomNameGenerator.new # {flatrng.compose(3)}

puts 'Cleaning flat database...'
Flat.destroy_all

# main seed creator / works with open uri aswell
uris.each_with_index do |uri, index|
  file = URI.open(uri)
  flat = Flat.new(
    user: User.last,
    adress: flat_names[index],
    description: flat_description[index],
    price: "#{rand(200..3000)}."
  )
  # Img uploader
  flat.photo.attach(io: file, filename: "#{flat.adress.split.first(5).join('_')}.jpg", content_type: 'image/jpg')
  flat.save
  p flat
  puts "flat created"
end
