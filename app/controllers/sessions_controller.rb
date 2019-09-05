class SessionsController < ApplicationController
  def new
    @user ||= User.new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
			flash[:notice] = "Logged in as #{user.first_name} #{user.last_name}"
      redirect_to dashboard_path
    else
      flash[:error] = "Looks like your email or password is invalid"
      render :new
    end
  end
end
