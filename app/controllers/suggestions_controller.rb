class SuggestionsController < ApplicationController
	filter_resource_access
	
	def new
		@suggestion = Suggestion.new
		@library_to_suggest = Library.find_by(id: params[:lib])
	end

	def create
		@suggestion = Suggestion.new
		@suggestion.creator = current_user
		@suggestion.library = Library.find_by(id: params["lib"].first)
		@receiver = User.find_by(email: params[:email])
		@suggestion.receiver = @receiver 

		if @suggestion.receiver
			if @suggestion.save
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
		@suggestion = Suggestion.find(params[:id])
  		@suggestion.destroy
    	redirect_to root_path
	end

	def accept
		@suggestion = Suggestion.find(params[:id])
		current_user.libraries.push(@suggestion.library)
		@suggestion.destroy
			redirect_to '/'
	end
end

