class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    redirect_to dashboard_path
  end
end
