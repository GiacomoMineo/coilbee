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
		@library = @tag.entries.first.section.category.library
	end
end
