class TagsController < ApplicationController
	filter_resource_access
		
	def index
		if params[:search]
      		@tags = Tag.search(params[:search])#.order("created_at DESC")
	    else
	        @tags = Tag.order("created_at DESC")
	    end

	end

	def show
		@tag = Tag.find(params[:id])
		@entries = @tag.entries
									 .includes(:tags)
									 .with_read_marks_for(current_user)
									 .sort_by { |entry| entry.rating }
									 .reverse!
		@library = @tag.entries.first.section.category.library
	end
end
