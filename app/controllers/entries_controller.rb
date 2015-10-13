class EntriesController < ApplicationController
	before_action :new_entry, :only => [:new]
	#filter_access_to :all#, :attribute_check => true
	filter_resource_access


	def upvote
		@entry = Entry.find(params[:id])
		@entry.upvote_by current_user 
		redirect_to request.referer || '/'  #go back where we came from
	end

	def downvote
		@entry = Entry.find(params[:id])
		@entry.downvote_by current_user 
		redirect_to request.referer || '/'  #go back where we came from
	end

	def accept
		@entry = Entry.find(params[:id])
		@entry.update_attributes(accepted: true)
		redirect_to request.referer || '/' #go back where we came from
	end

	def read
		@entry = Entry.find(params[:id])
		@entry.mark_as_read! :for => current_user
		redirect_to request.referer || '/' #go back where we came from
	end

	def new
		@library = Library.find(params[:lib])
		@groups = @library.groups
		#~ @entry = Entry.new
	end

	def create
		@entry = Entry.new(entry_params) 
		@section = Section.friendly.find(entry_params[:section_id])
  		if @entry.save
			redirect_to library_category_section_path(@section.category.library, @section.category, @section), :notice => "Entry saved succesfully" 
  		else 
    		render library_category_section_path(@section.category.library, @section.category, @section), :notice => "Could not save entry" 
  		end
	end

	def edit
		@entry = Entry.find(params[:id])
		@library = @entry.section.category.library
		@groups = @library.groups
	end

	def update
		@entry = Entry.find(params[:id])

		if @entry.update_attributes(entry_params)
			if @entry.accepted
				redirect_to library_category_section_path(@entry.section.category.library, @entry.section.category, @entry.section), :notice => "The entry has been edited"
			else
				redirect_to library_category_section_path(@entry.section.category.library, @entry.section.category, @entry.section) , :notice => "The entry has been edited"
			end
		else
			render 'edit', :notice => "Could not edit entry" 
		end
	end
	def destroy
		@entry = Entry.find(params[:id])
  		@entry.destroy
    	redirect_to request.referer || '/' #go back where we came from
	end

	
	private
		def entry_params
			params.require(:entry).permit(:title, :link, :description, :section_id, :group_id, :accepted)
		end
		def new_entry
			@entry = Entry.new
		end
end
