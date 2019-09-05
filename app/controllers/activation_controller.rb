class ActivationController < ApplicationController
  def create
    user = User.find_by(registered: params[:code])
  	if user.nil?
  		flash[:error] = "User not found!"
  		redirect_to root_path
  	else
  		user.update_attributes(registered: "true")
      flash[:notice] = "Thank you! Your account is now activated."
      redirect_to dashboard_path
  	end
  end
end
