class EntriesController < ApplicationController
	filter_resource_access
	
	def upvote
		@entry = Entry.find(params[:id])
		@entry.upvote_by current_user 
		redirect_to request.referer #go back where we came from
	end

	def downvote
		@entry = Entry.find(params[:id])
		@entry.downvote_by current_user 
		redirect_to request.referer #go back where we came from
	end

	def read
		@entry = Entry.find(params[:id])
		@entry.mark_as_read! :for => current_user
		redirect_to request.referer #go back where we came from
	end

	def index
		@entries = Entry.all
	end

	def new
		@entry = Entry.new
	end

	def create
		@entry = Entry.new(entry_params) 
  		if @entry.save 
			redirect_to '/entries' 
  		else 
    		render 'new' 
  		end
	end
	
	private
		def entry_params
			params.require(:entry).permit(:title, :link, :description, :section_id)
		end
end
