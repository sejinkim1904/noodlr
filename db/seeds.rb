# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tokio = Restaurant.new(name: 'Tokio')
tokio.items.new(name: "Tonkotsu", price: 1400, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg")
tokio.items.new(name: 'Shoyu', price: 1300, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/mrqOZ_4ev2UhJWlcUEzVHg/o.jpg')
tokio.items.new(name: 'Miso', price: 1100, category: 'ramen', image: 'https://s3-media4.fl.yelpcdn.com/bphoto/NzCFOr94zjfiR59mpeWDHA/o.jpg')

corner_ramen = Restaurant.new(name: 'Corner Ramen')
corner_ramen.items.new(name: 'Tonkotsu', price: 1500, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/QwiPN5PjNzJNb5DXTkiGrQ/o.jpg')
corner_ramen.items.new(name: 'Miso', price: 1500, category: 'ramen', image: 'https://s3-media2.fl.yelpcdn.com/bphoto/UhnN0QZ_Er1O6GMMmyHUgg/o.jpg')

kyoto_ramen = Restaurant.new(name: 'Kyoto Ramen')
kyoto_ramen.items.new(name: 'Tonkotsu', price: 1100, category: 'ramen', image: 'https://static.wixstatic.com/media/52f6d0_d19735a7d3bc41e5966478b3d6704824~mv2_d_4933_3289_s_4_2.jpg/v1/fill/w_1960,h_1120,al_c,q_90,usm_0.66_1.00_0.01/52f6d0_d19735a7d3bc41e5966478b3d6704824~mv2_d_4933_3289_s_4_2.webp')

tycoon_ramen_and_sushi = Restaurant.new(name: 'Tycoon Ramen and Sushi')
tycoon_ramen_and_sushi.items.new(name: 'Tonkotsu', price: 1400, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/Wv2kkD1X48OL-jKgTLUojw/o.jpg')
tycoon_ramen_and_sushi.items.new(name: 'Shoyu', price: 1200, category: 'ramen', image: 'https://s3-media1.fl.yelpcdn.com/bphoto/J9_3r7QRUG2vy0MTcP25WQ/o.jpg')
tycoon_ramen_and_sushi.items.new(name: 'Miso', price: 1200, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/UZTVaZgrGHtwzbnPMleR_g/o.jpg')

osaka = Restaurant.new(name: 'Osaka')
osaka.items.new(name: 'Tonkotsu', price: 1400, category: 'ramen', image: 'https://s3-media4.fl.yelpcdn.com/bphoto/VZcQsIvJy-Sx1g_52KI6rA/o.jpg')
osaka.items.new(name: 'Shoyu', price: 1400, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/hgVycMdM7wqzE0qqkP7Z9w/o.jpg')
osaka.items.new(name: 'Miso', price: 1400, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/Q4Fj9teq_jwHwZ_OgXC5Bg/o.jpg')

domo = Restaurant.new(name: 'Domo')
domo.items.new(name: 'Shoyu', price: 1650, category: 'ramen', image: 'https://s3-media1.fl.yelpcdn.com/bphoto/Ef-ipYBVtthPvgkT-Sx26g/o.jpg')

ifish_ramen = Restaurant.new(name: 'iFish+Ramen')
ifish_ramen.items.new(name: 'Shoyu', price: 1295, category: 'ramen', image: 'https://assets.bonappetit.com/photos/57ae038653e63daf11a4e122/16:9/w_1000,c_limit/shoyu-ramen.jpg')

obento = Restaurant.new(name: 'Obento')
obento.items.new(name: 'Shoyu', price: 945, category: 'ramen', image: 'https://s3-media4.fl.yelpcdn.com/bphoto/_QbXb2scWldTKBPrOObx7g/o.jpg')

ramen_star = Restaurant.new(name: 'Ramen Star')
ramen_star.items.new(name: 'Miso', price: 1350, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/HttgXjvENTITjtz4A4EE8A/o.jpg')

mizu_izakaya = Restaurant.new(name: 'Mizu Izakaya')
mizu_izakaya.items.new(name: 'Miso', price: 1500, category: 'ramen', image: 'https://s3-media4.fl.yelpcdn.com/bphoto/SArvq7e-mBM1ElNpKnecPA/o.jpg')
