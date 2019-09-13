class DashboardFacade

	def initialize(current_user)
		@current_user = current_user
	end

  def active?
    @current_user.registered == "true" ? "active" : "inactive"
  end

	def reviews
		@current_user.reviews
	end

	def pending_items
		restaurant = Restaurant.includes(:items).find(@current_user.restaurant_id)
		if restaurant
			return restaurant.items.where(status: 'pending')
		else
			return []
		end
	end
end
