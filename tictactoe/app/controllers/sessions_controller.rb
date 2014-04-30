class SessionsController < ApplicationController
  
 def new 
 end
 
 def create 
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
   session[:user_id] = user.id
   redirect_to tic_tac_toes_path, notice: "Welcome, you are now logged in!"
  else
   flash.now.alert = "Ohh, invalid login credentials - lets try again!"
   render "new"
  end
 end
 
 def destroy
  session[:user_id] = nil
  redirect_to root_url, notice: "You are now logged out, see you soon!"
 end

end