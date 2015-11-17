class InvitationsController < ApplicationController
	before_action :new_invitation
	filter_resource_access
	
	def new
	end

	def create
		@invitation = Invitation.new(invitation_params)
		@invitation.library = @library
		@invitation.creator = current_user

		if @invitation.save
			redirect_to '/'
		else
			render 'new', :notice => "Could not create invitation."
		end
	end

	def destroy
		@invitation.destroy
		redirect_to root_path
	end

	def accept
		@library = @invitation.library
		current_user.libraries.push(@library)
		@invitation.destroy
		redirect_to library_path(@library)
	end


	def invitation_params
		params.require(:invitation).permit(:receiver_email)
	end

	def new_invitation
		if params[:id] then
			@invitation = Invitation.find(params[:id])
		else
			@invitation = Invitation.new
		end

		if @invitation.library then
			@library = @invitation.library
		elsif params[:library_id] then
			@library = Library.find(params[:library_id])
			@invitation.library = @library
		end
	end
end

