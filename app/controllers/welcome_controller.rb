class WelcomeController < ApplicationController
  def index
    @coordinates = location.coordinates
    @restaurants = Restaurant.near(@coordinates, 5)
  end
end
