class InstagramsController < ApplicationController
  def create
    instagram_user = Instagram.where(uid: request.env["omniauth.auth"][:uid])
    if instagram_user.count == 1
      session[:user_id] = instagram_user.first.user_id
      flash[:notice] = "Signed in with Instagram!"
      redirect_to root_path
    else
      new_user = User.create(auth_type: :instagram, registered: 'true')
      new_user.instagrams.create(uid: request.env["omniauth.auth"][:uid], name: request.env["omniauth.auth"][:info][:name])
      session[:user_id] = new_user.id
      flash[:notice] = "Signed in with Instagram!"
      redirect_to root_path
    end
    session[:username] = request.env["omniauth.auth"][:info][:name]
  end
end
