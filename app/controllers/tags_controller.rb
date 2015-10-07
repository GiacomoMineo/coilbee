class TagsController < ApplicationController
	filter_resource_access
		
	def index
		if params[:library_id] and params[:search]
				@library = Library.find(params[:library_id])
				@tags = @library.tags.search(params[:search])
		else
				redirect_to(request.referer || '/', alert: "Request invalid.")
		end
	end

	def show
		@tag = Tag.find(params[:id])
		@entries = @tag.entries.select { |e| e.accepted == true }#.for_user(current_user)
		@library = @entries.first.section.category.library
		@groups = @library.groups
	end
end
