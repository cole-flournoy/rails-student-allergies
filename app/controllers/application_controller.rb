class ApplicationController < ActionController::Base

  def logged_in?
    !!current_user
  end
  
  def verify_logged_in
    if !logged_in?
      redirect_to login_path
    end
  end
  
  def verify_user
    if current_user.classrooms.include?(@classroom)
    else
      flash[:alert] = "You don't have permission to view that"
      redirect_to classrooms_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def redirect_if_logged_in
    redirect_to classrooms_path if logged_in?
  end
  
  helper_method :current_user
  helper_method :logged_in?
  
end
