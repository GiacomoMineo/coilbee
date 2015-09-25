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
		@entries = @tag.entries.for_user(current_user)
		@library = @entries.first.section.category.library
	end
end
