class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.includes(:items).find(params[:id])
  end
end
