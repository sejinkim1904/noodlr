class UsersController < ApplicationController
  def show
    render locals: { facade: DashboardFacade.new(current_user) }
  end
end
