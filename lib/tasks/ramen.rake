namespace :ramen do
  task denver: :environment do
    yelp = YelpService.new
    restaurants_1 = yelp.restaurants("japanese ramen", "Denver, CO", 50)
    restaurants_2 = yelp.restaurants("japanese ramen", "Denver, CO", 50, 51)
    restaurants = restaurants_1[:businesses] + restaurants_2[:businesses]

    restaurants.map do |attr|
      Restaurant.create(
        name: attr[:name],
        yelp_id: attr[:id],
        rating: attr[:rating],
        latitude: attr[:coordinates][:latitude],
        longitude: attr[:coordinates][:longitude],
        address_1: attr[:location][:address1],
        address_2: attr[:location][:address2],
        city: attr[:location][:city],
        state: attr[:location][:state],
        zip_code: attr[:location][:zip_code],
        phone: attr[:display_phone]
      )
    end

    tokio = Restaurant.find_by(name: 'Tokio')
    tokio.items.create!(name: "Tonkotsu", price: 14.00, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg", status: 'verified')
    tokio.items.create!(name: 'Shoyu', price: 13.00, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/mrqOZ_4ev2UhJWlcUEzVHg/o.jpg', status: 'verified')
    tokio.items.create!(name: 'Miso', price: 11.00, category: 'ramen', image: 'https://s3-media4.fl.yelpcdn.com/bphoto/NzCFOr94zjfiR59mpeWDHA/o.jpg', status: 'verified')

    corner_ramen = Restaurant.find_by(name: 'Corner Ramen')
    corner_ramen.items.create!(name: 'Tonkotsu', price: 15.00, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/QwiPN5PjNzJNb5DXTkiGrQ/o.jpg', status: 'verified')
    corner_ramen.items.create!(name: 'Miso', price: 15.00, category: 'ramen', image: 'https://s3-media2.fl.yelpcdn.com/bphoto/UhnN0QZ_Er1O6GMMmyHUgg/o.jpg', status: 'verified')

    kyoto_ramen = Restaurant.find_by(name: 'Kyoto Ramen')
    kyoto_ramen.items.create!(name: 'Tonkotsu', price: 11.00, category: 'ramen', image: 'https://static.wixstatic.com/media/52f6d0_d19735a7d3bc41e5966478b3d6704824~mv2_d_4933_3289_s_4_2.jpg/v1/fill/w_1960,h_1120,al_c,q_90,usm_0.66_1.00_0.01/52f6d0_d19735a7d3bc41e5966478b3d6704824~mv2_d_4933_3289_s_4_2.webp', status: 'verified')

    tycoon_ramen_and_sushi = Restaurant.find_by(name: 'Tycoon Ramen and Sushi')
    tycoon_ramen_and_sushi.items.create!(name: 'Tonkotsu', price: 14.00, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/Wv2kkD1X48OL-jKgTLUojw/o.jpg', status: 'verified')
    tycoon_ramen_and_sushi.items.create!(name: 'Shoyu', price: 12.00, category: 'ramen', image: 'https://s3-media1.fl.yelpcdn.com/bphoto/J9_3r7QRUG2vy0MTcP25WQ/o.jpg', status: 'verified')
    tycoon_ramen_and_sushi.items.create!(name: 'Miso', price: 12.00, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/UZTVaZgrGHtwzbnPMleR_g/o.jpg', status: 'verified')

    osaka = Restaurant.find_by(name: 'Osaka Ramen')
    osaka.items.create!(name: 'Tonkotsu', price: 14.00, category: 'ramen', image: 'https://s3-media4.fl.yelpcdn.com/bphoto/VZcQsIvJy-Sx1g_52KI6rA/o.jpg', status: 'verified')
    osaka.items.create!(name: 'Shoyu', price: 14.00, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/hgVycMdM7wqzE0qqkP7Z9w/o.jpg', status: 'verified')
    osaka.items.create!(name: 'Miso', price: 14.00, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/Q4Fj9teq_jwHwZ_OgXC5Bg/o.jpg', status: 'verified')

    domo = Restaurant.find_by(name: 'Domo Japanese Country Foods Restaurant')
    domo.items.create!(name: 'Shoyu', price: 16.50, category: 'ramen', image: 'https://s3-media1.fl.yelpcdn.com/bphoto/Ef-ipYBVtthPvgkT-Sx26g/o.jpg', status: 'verified')

    ifish_ramen = Restaurant.find_by(name: 'iFish+Ramen')
    ifish_ramen.items.create!(name: 'Shoyu', price: 12.95, category: 'ramen', image: 'https://assets.bonappetit.com/photos/57ae038653e63daf11a4e122/16:9/w_1000,c_limit/shoyu-ramen.jpg', status: 'verified')

    obento = Restaurant.find_by(name: 'Obento')
    obento.items.create!(name: 'Shoyu', price: 9.45, category: 'ramen', image: 'https://s3-media4.fl.yelpcdn.com/bphoto/_QbXb2scWldTKBPrOObx7g/o.jpg', status: 'verified')

    ramen_star = Restaurant.find_by(name: 'Ramen Star')
    ramen_star.items.create!(name: 'Miso', price: 13.50, category: 'ramen', image: 'https://s3-media3.fl.yelpcdn.com/bphoto/HttgXjvENTITjtz4A4EE8A/o.jpg', status: 'verified')

    mizu_izakaya = Restaurant.find_by(name: 'Mizu Izakaya')
    mizu_izakaya.items.create!(name: 'Miso', price: 15.00, category: 'ramen', image: 'https://s3-media4.fl.yelpcdn.com/bphoto/SArvq7e-mBM1ElNpKnecPA/o.jpg', status: 'verified')

    jake = User.create!(registered: 'true')
    sejin = User.create!(registered: 'true')
    andrew = User.create!(registered: 'true')
    tyler = User.create!(registered: 'true')

    users = [jake, sejin, andrew, tyler]

    titles = ["Delicious!", "Amazing!", "Decent", "Could be Better", "Don't eat this"]
    bodies = ["Best broth ever", "Pork was amazing", "very generic, not authentic", "Broth was very bland", "Noodles were very soggy"]

    users.each do |user|
      Item.all.each do |item|
        item.reviews.create(
          user: user,
          title: titles.sample,
          body: bodies.sample,
          rating: rand(1..5)
        )
      end
    end
  end
end
