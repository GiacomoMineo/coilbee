class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params) 
		# make emails lowercase to enforce uniqueness constraint
		@user.email = user_params[:email].downcase
  		if @user.save 
	    	session[:user_id] = @user.id 
	    	redirect_to '/' 
	  	else 
	    	redirect_to '/signup' 
	  	end 
	end

	private
		def user_params
			params.require(:user). permit(:first_name, :last_name, :user_name, :email, :password)
		end
end
