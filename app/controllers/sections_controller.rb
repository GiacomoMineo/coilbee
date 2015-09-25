class SectionsController < ApplicationController
	filter_resource_access
	
	def show
		@section = Section.find(params[:id])
		@library = @section.category.library

		@entries_unread = Entry.unread_by(current_user)
	
		@entries_group_read = @section.entries.read.sort { |a, b| (b.get_likes.size-b.get_dislikes.size) <=> (a.get_likes.size-a.get_dislikes.size)}
		@entries_group_learn = @section.entries.learn.sort { |a, b| (b.get_likes.size-b.get_dislikes.size) <=> (a.get_likes.size-a.get_dislikes.size)}
		@entries_group_watch = @section.entries.watch.sort { |a, b| (b.get_likes.size-b.get_dislikes.size) <=> (a.get_likes.size-a.get_dislikes.size)}
		@entries_group_make = @section.entries.make.sort { |a, b| (b.get_likes.size-b.get_dislikes.size) <=> (a.get_likes.size-a.get_dislikes.size)}
		
	end
	
	def new
		@section = Section.new
		@category = Category.find_by(id: params[:cat])
		@library = @category.library
	end
	
	def create
		@section = Section.new(section_params) 
		@category = Category.find_by(id: params["cat"].first)
		@section.category = @category
  		if @section.save
			redirect_to '/sections/' + @section.id.to_s
  		else 
    		render 'new' 
  		end 
	end

	def edit
		@section = Section.find(params[:id])
		@library = @section.category.library
	end

	def update
		@section = Section.find(params[:id])
		if @section.update_attributes(section_params)
			redirect_to library_path(@section.category.library), :notice => "The section has been edited"
		else
			render 'edit'
		end
	end

	def destroy
		@section = Section.find(params[:id])#TODO delete recursively all entries
		@library = @section.category.library
		@section.destroy 
		redirect_to library_path(@library), :notice => "The section has been deleted"
	end
	
	private
		def section_params
			params.require(:section).permit(:name, :category_id)
		end
end
