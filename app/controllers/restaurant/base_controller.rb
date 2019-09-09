class Restaurant::BaseController < ApplicationController
  before_action :require_restaurant

  private

  def require_restaurant
    redirect_to root_path unless current_user.restaurant? && current_user.registered == 'true'
  end
end
