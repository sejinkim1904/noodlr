class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
