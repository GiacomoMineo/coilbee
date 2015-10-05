class EntriesController < ApplicationController
	#filter_resource_access
	#filter_access_to :all


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

	def accept
		@entry = Entry.find(params[:id])
		@entry.update_attributes(accepted: true)
		redirect_to request.referer #go back where we came from
	end

	def read
		@entry = Entry.find(params[:id])
		@entry.mark_as_read! :for => current_user
		redirect_to request.referer #go back where we came from
	end

	def index
		@library = Library.find_by(id: params[:lib])

		@sections = []
		@library.categories.each {|cat| @sections.push(cat.sections)}
		@sections.flatten!

		@entries = []
		@sections.each {|sec| @entries.push(sec.entries) }

		@entries = @entries.flatten.select{|e| e.accepted == false}

	end

	def suggest
		@library = Library.find_by(id: params[:lib])
		
		@sections = []
		@library.categories.each do |cat|
			@sections.push(cat.sections)
		end
		@sections = @sections.flatten
		
		@groups = @library.groups
		@entry = Entry.new
	end

	def new
		@library = Library.find_by(id: params[:lib])
		@section = Section.find_by(id: params[:sec])	
		@groups = @library.groups
		@entry = Entry.new
	end

	def create
		@entry = Entry.new(entry_params) 
  		if @entry.save
			redirect_to section_path(entry_params[:section_id]), :notice => "Entry saved succesfully" 
  		else 
    		render section_path(entry_params[:section_id]), :notice => "Could not save entry" 
  		end
	end

	def destroy
		@entry = Entry.find(params[:id])
  		@entry.destroy
    	redirect_to request.referer #go back where we came from
	end

	
	private
		def entry_params
			params.require(:entry).permit(:title, :link, :description, :section_id, :group_id, :accepted)
		end
end
