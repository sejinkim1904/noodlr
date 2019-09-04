class UsersController < ApplicationController
  def show
    render locals: { facade: DashboardFacade.new(current_user) }
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params.merge(registered: SecureRandom.hex))
    if user.save
      session[:user_id] = user.id
			flash[:notice] = "Logged in as #{user.first_name} #{user.last_name}"
			redirect_to send_registration_path
    else
      flash[:error] = 'That email has already been taken.'
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
