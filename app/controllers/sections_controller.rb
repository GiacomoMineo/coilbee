class SectionsController < ApplicationController

	before_action :require_admin, only: [:new, :create]

	def show
		@section = Section.find(params[:id])
		@library = @section.category.library

		@entries_unread = Entry.unread_by(current_user)
		@entries_read = Entry.read_by(current_user)

		@entries_group_read = @section.entries.read.sort { |a, b| (b.get_likes.size-b.get_dislikes.size) <=> (a.get_likes.size-a.get_dislikes.size)}
		@entries_group_learn = @section.entries.learn.sort { |a, b| (b.get_likes.size-b.get_dislikes.size) <=> (a.get_likes.size-a.get_dislikes.size)}
		@entries_group_watch = @section.entries.watch.sort { |a, b| (b.get_likes.size-b.get_dislikes.size) <=> (a.get_likes.size-a.get_dislikes.size)}
		@entries_group_make = @section.entries.make.sort { |a, b| (b.get_likes.size-b.get_dislikes.size) <=> (a.get_likes.size-a.get_dislikes.size)}
		
	end
	
	def new
		@section = Section.new
	end
	
	def create
		@section = Section.new(section_params) 
  		if @section.save 
			redirect_to '/section/' + @section.id.to_s
  		else 
    		render 'new' 
  		end 
	end
	
	private
		def section_params
			params.require(:section).permit(:name, :category_id)
		end
end
