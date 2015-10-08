class InvitationsController < ApplicationController
	filter_resource_access
	
	def new
		@invitation = Invitation.new
		@library_to_suggest = Library.find_by(id: params[:lib])
	end

	def create
		@invitation = Invitation.new
		@invitation.creator = current_user
		@invitation.library = Library.find_by(id: params["lib"].first)
		@receiver = User.find_by(email: params[:email])
		@invitation.receiver = @receiver 

		if @invitation.receiver
			if @invitation.save
				redirect_to '/'
			else
				render 'new'
			end
		else
			@library_to_suggest = Library.find_by(id: params["lib"].first)
			render 'new', :notice => "Couldn't find user with this email address!"
		end 
	end

	def destroy
		@invitation = Invitation.find(params[:id])
  		@invitation.destroy
    	redirect_to root_path
	end

	def accept
		@invitation = Invitation.find(params[:id])
		current_user.libraries.push(@invitation.library)
		@invitation.destroy
			redirect_to '/'
	end
end

