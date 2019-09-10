class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create
    user = User.create(registered: SecureRandom.hex, auth_type: :email)
    email = user.emails.new(email_params)
    if email.save
      session[:user_id] = user.id
			flash[:notice] = "Logged in as #{email.email}"
			redirect_to send_registration_path
    else
      user.destroy
      flash[:error] = 'That email has already been taken.'
      redirect_to new_email_path
    end
  end

  private

  def email_params
    params.require(:email).permit(:email, :password)
  end
end
