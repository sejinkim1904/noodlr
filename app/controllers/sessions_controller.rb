class SessionsController < ApplicationController
  def new
    @user ||= User.new
  end

  def create
    email = Email.find_by(email: params[:session][:email])
    if email && email.authenticate(params[:session][:password])
      user = email.user
      session[:user_id] = user.id
			flash[:notice] = "Logged in as #{email.email}"
      redirect_to dashboard_path
    else
      flash[:error] = "Your email or password is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
