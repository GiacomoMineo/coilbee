class SectionsController < ApplicationController

	def show
		@section = Section.find(params[:id])
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
