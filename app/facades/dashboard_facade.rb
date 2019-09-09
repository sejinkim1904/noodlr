class DashboardFacade

	def initialize(current_user)
		@current_user = current_user
	end

  def active?
    @current_user.registered == "true" ? "active" : "inactive"
  end
end
