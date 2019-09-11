class WelcomeController < ApplicationController
  def index
    @items_by_rating = Item.by_avg_rating
    @coordinates = location.coordinates
    @restaurants = Restaurant.near(@coordinates, 5)
  end
end
