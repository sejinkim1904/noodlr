class FacebooksController < ApplicationController
  def create
    facebook_user = Facebook.where(uid: request.env["omniauth.auth"][:uid])
    if facebook_user.count == 1
      session[:user_id] = facebook_user.first.user_id
      flash[:notice] = "Signed in with Facebook!"
      redirect_to root_path
    else
      new_user = User.create(role: :default, auth_type: :facebook, registered: true)
      new_facebook_user = Facebook.create(uid: request.env["omniauth.auth"][:uid],name: request.env["omniauth.auth"][:info][:name], user: new_user)
      session[:user_id] = new_facebook_user.user_id
      flash[:notice] = "Signed in with Facebook!"
      redirect_to root_path
    end
    session[:username] = request.env["omniauth.auth"][:info][:name]
  end
end
