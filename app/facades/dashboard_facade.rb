class DashboardFacade

	def initialize(current_user)
		@current_user = current_user
	end

  def active_message
    if @current_user.registered == "true"
      "Status: Active"
    else
      "This account has not yet been activated. Please check your email."
    end
  end
end
