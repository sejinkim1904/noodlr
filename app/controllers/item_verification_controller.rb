class ItemVerificationController < ApplicationController
  def new
    restaurant = Restaurant.find(params[:id])
    owners = restaurant.users
    unless owners.empty?
      conn = Faraday.new(url: "http://localhost:4567") do |faraday|
        faraday.params["MICRO_KEY"] = ENV["MICRO_KEY"]
        faraday.params["restaurant_id"] = restaurant.id
        faraday.params["email"] = owners.first.email
        faraday.params["num_items"] = restaurant.num_pending
        faraday.adapter Faraday.default_adapter
      end
      conn.get("/verify")
    end
		redirect_to restaurant_path(params[:id])
  end
end
