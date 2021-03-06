class SessionsController < ApplicationController
  def new
    redirect_if_logged_in
  end

  def create
    if access_token = request.env["omniauth.auth"]
      if existing_user = User.find_by(username: access_token[:info][:email])
        session[:user_id] = existing_user.id
        redirect_to '/classrooms'
      else
        new_user = User.create(username: access_token[:info][:email], password: access_token[:uid], google: true)
        session[:user_id] = new_user.id
        redirect_to '/classrooms'
      end
    else
      user = User.find_by(username: params[:username])
      if user && user.google == true
        flash[:alert] = "Please log in with Google to see your saved content"
        render :new
      else
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to '/classrooms'
        else 
          render :new
        end 
      end
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end