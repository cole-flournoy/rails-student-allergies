class SessionsController < ApplicationController
  def new
 
  end

  def create
    access_token = request.env["omniauth.auth"]
    byebug
    
    
    
    # user = User.find_by(username: params[:username])
    # if user && user.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   redirect_to '/'
    # else 
    #   flash[:alert] = "Could not log in with given information"
    #   render :new
    # end 
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end