class SectionsController < ApplicationController

	before_action :require_admin, only: [:new, :create]

	def show
		@section = Section.find(params[:id])
		@entries = @section.entries.sort { |a, b| (b.get_likes.size-b.get_dislikes.size) <=> (a.get_likes.size-a.get_dislikes.size)}
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
