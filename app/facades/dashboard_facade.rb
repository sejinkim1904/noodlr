class DashboardFacade

	def initialize(current_user)
		@current_user = current_user
	end

  def active_message
    if @current_user.registered == "true" ? "active" : "inactive"

    else
      
    end
  end
end
