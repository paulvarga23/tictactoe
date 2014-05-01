class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  def current_user
    begin
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    
    rescue ActiveRecord::RecordNotFound
      session.delete :user_id
      nil

    end
  end

  def logged_in?
    !!current_user
  end
  
  private
  def authenticate
    unless logged_in?
      flash[:error] = "You must be logged in to access this section of the site"
      redirect_to login_url
    end
  end

end


