# default = User.create!(email: 'default@user.com', first_name: 'default', last_name: 'user', password: 'default', role: 0, registered: 'default')
# User.create!(email: 'admin@user.com', first_name: 'admin', last_name: 'user', password: 'admin', role: 0, registered: 'admin')
# User.create!(email: 'restaurant@user.com', first_name: 'restaurant', last_name: 'user', password: 'restaurant', role: 0, registered: 'restaurant')

# tokio = Restaurant.create!(name: 'Tokio', latitude: 39.7586035, longitude: -104.9974398)
# tokio.items.create!(name: "Tonkotsu", price: 1400, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg", status: 'verified')
# Item.last.reviews.create!(user: default, title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 5)
# Item.last.reviews.create!(user: default, title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 3)
# tokio.items.create!(name: 'Shoyu', price: 1300, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/mrqOZ_4ev2UhJWlcUEzVHg/o.jpg', status: 'verified')
# Item.last.reviews.create!(user: default, title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 5)
# tokio.items.create!(name: 'Miso', price: 1100, category: 'ramen', image: 'https://s3-media4.fl.yelpcdn.com/bphoto/NzCFOr94zjfiR59mpeWDHA/o.jpg', status: 'verified')
# Item.last.reviews.create!(user: default, title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 5)
#
# corner_ramen = Restaurant.create!(name: 'Corner Ramen', latitude: 39.7646469, longitude: -104.967434)
# corner_ramen.items.create!(name: 'Tonkotsu', price: 1500, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/QwiPN5PjNzJNb5DXTkiGrQ/o.jpg', status: 'verified')
# corner_ramen.items.create!(name: 'Miso', price: 1500, category: 'ramen', image: 'https://s3-media2.fl.yelpcdn.com/bphoto/UhnN0QZ_Er1O6GMMmyHUgg/o.jpg', status: 'verified')
#
# kyoto_ramen = Restaurant.create!(name: 'Kyoto Ramen', latitude: 39.7456481, longitude: -104.9919217)
# kyoto_ramen.items.create!(name: 'Tonkotsu', price: 1100, category: 'ramen', image: 'https://static.wixstatic.com/media/52f6d0_d19735a7d3bc41e5966478b3d6704824~mv2_d_4933_3289_s_4_2.jpg/v1/fill/w_1960,h_1120,al_c,q_90,usm_0.66_1.00_0.01/52f6d0_d19735a7d3bc41e5966478b3d6704824~mv2_d_4933_3289_s_4_2.webp', status: 'verified')
#
# tycoon_ramen_and_sushi = Restaurant.create!(name: 'Tycoon Ramen and Sushi', latitude: 39.7398646, longitude: -104.9825041)
# tycoon_ramen_and_sushi.items.create!(name: 'Tonkotsu', price: 1400, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/Wv2kkD1X48OL-jKgTLUojw/o.jpg', status: 'verified')
# tycoon_ramen_and_sushi.items.create!(name: 'Shoyu', price: 1200, category: 'ramen', image: 'https://s3-media1.fl.yelpcdn.com/bphoto/J9_3r7QRUG2vy0MTcP25WQ/o.jpg', status: 'verified')
# tycoon_ramen_and_sushi.items.create!(name: 'Miso', price: 1200, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/UZTVaZgrGHtwzbnPMleR_g/o.jpg', status: 'verified')
#
# osaka = Restaurant.create!(name: 'Osaka', latitude: 39.7595063, longitude: -104.9861053)
# osaka.items.create!(name: 'Tonkotsu', price: 1400, category: 'ramen', image: 'https://s3-media4.fl.yelpcdn.com/bphoto/VZcQsIvJy-Sx1g_52KI6rA/o.jpg', status: 'verified')
# osaka.items.create!(name: 'Shoyu', price: 1400, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/hgVycMdM7wqzE0qqkP7Z9w/o.jpg', status: 'verified')
# osaka.items.create!(name: 'Miso', price: 1400, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/Q4Fj9teq_jwHwZ_OgXC5Bg/o.jpg', status: 'verified')
#
# domo = Restaurant.create!(name: 'Domo', latitude: 39.7382478, longitude: -105.0055633)
# domo.items.create!(name: 'Shoyu', price: 1650, category: 'ramen', image: 'https://s3-media1.fl.yelpcdn.com/bphoto/Ef-ipYBVtthPvgkT-Sx26g/o.jpg', status: 'verified')
#
# ifish_ramen = Restaurant.create!(name: 'iFish+Ramen', latitude: 39.7554958, longitude: -104.9906707)
# ifish_ramen.items.create!(name: 'Shoyu', price: 1295, category: 'ramen', image: 'https://assets.bonappetit.com/photos/57ae038653e63daf11a4e122/16:9/w_1000,c_limit/shoyu-ramen.jpg', status: 'verified')
#
# obento = Restaurant.create!(name: 'Obento', latitude: 39.7454649, longitude: -104.9923438)
# obento.items.create!(name: 'Shoyu', price: 945, category: 'ramen', image: 'https://s3-media4.fl.yelpcdn.com/bphoto/_QbXb2scWldTKBPrOObx7g/o.jpg', status: 'verified')
#
# ramen_star = Restaurant.create!(name: 'Ramen Star', latitude: 39.77260500000001, longitude: -105.0110397)
# ramen_star.items.create!(name: 'Miso', price: 1350, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/HttgXjvENTITjtz4A4EE8A/o.jpg', status: 'verified')
#
# mizu_izakaya = Restaurant.create!(name: 'Mizu Izakaya', latitude: 39.759007, longitude: -105.010486)
# mizu_izakaya.items.create!(name: 'Miso', price: 1500, category: 'ramen', image: 'https://s3-media4.fl.yelpcdn.com/bphoto/SArvq7e-mBM1ElNpKnecPA/o.jpg', status: 'verified')