class SectionsController < ApplicationController
	before_action :new_section
	filter_resource_access

	
	def show
		@entries = @section.entries.select { |e| e.accepted == true }
	 	@groups = @section.category.library.groups

	end
	
	def new
	end
	
	def create
		@section = Section.new(section_params)
		@section.category = @category
  	if @section.save
			redirect_to section_path(@section)
  		else 
    		render 'new' 
  		end 
	end

	def edit
	end

	def update
		if @section.update_attributes(section_params)
			redirect_to library_path(@section.category.library), :notice => "The section has been edited"
		else
			render 'edit'
		end
	end

	def destroy
		@section.destroy 
		redirect_to library_path(@library), :notice => "The section has been deleted"
	end
	
	private
		def section_params
			params.require(:section).permit(:name, :category_id)
		end
		
		def new_section
			if params[:id] then
				@section = Section.find(params[:id])
			else 
				@section = Section.new
			end
			
			if @section.category then
				@category = @section.category
			elsif params[:category_id] then
				@category = Category.find(params[:category_id])
				@section.category = @category
			end
			
			if @category && @category.library then
				@library = @category.library
			end
		end
end
