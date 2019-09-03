class RegistrationController < ApplicationController
  def new
    RegistrationMailer.register(current_user).deliver_now
		redirect_to dashboard_path
  end
end
