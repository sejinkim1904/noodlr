class RegistrationMailer < ApplicationMailer
	def register(current_user)
		@user = current_user
		mail(to: current_user.email, subject: "Activate Your Account")
	end
end
