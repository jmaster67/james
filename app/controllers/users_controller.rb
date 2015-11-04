class UsersController < ApplicationController

	def create
	   user = User.find_by_email(params[:email])  
	    if user && user.authenticate(params[:password])    
	     session[:user_id] = user.id     
	     redirect_to root_path, :notice => "Welcome back, #{user.email}"   
	 	else     
	 	flash[:alert] = "Invalid email or password"     render "new"   
	    end
	 end 
end
