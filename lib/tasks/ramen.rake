namespace :ramen do
  task denver: :environment do
    yelp = YelpService.new
    restaurants = yelp.restaurants("ramen", "Denver, CO")
    binding.pry
  end
end
