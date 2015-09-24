class SuggestionsController < ApplicationController

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
end

