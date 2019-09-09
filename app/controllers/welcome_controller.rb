class WelcomeController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
end
