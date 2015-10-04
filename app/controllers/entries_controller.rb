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
		@library = Library.find_by(id: params[:lib])
		@entries = Entry.where(accepted: false)
	end

	def new
		@library = Library.find_by(id: params[:lib])
		
		@sections = []
		@library.categories.each do |cat|
			@sections.push(cat.sections)
		end
		@sections = @sections.flatten
		
		@groups = @library.groups
		@entry = Entry.new
	end

	def create
		@entry = Entry.new(entry_params) 
  		if @entry.save
			redirect_to section_path(entry_params[:section_id]) 
  		else 
    		render 'new' 
  		end
	end
	
	private
		def entry_params
			params.require(:entry).permit(:title, :link, :description, :section_id, :group_id)
		end
end
