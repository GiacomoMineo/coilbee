class SectionsController < ApplicationController
	before_filter :load_category, :load_library
	before_action :new_section, :only => :new
	filter_resource_access



	
	def show
		@section = Section.find(params[:id])
		@entries = @section.entries.select { |e| e.accepted == true }
	 	@groups = @library.groups

	end
	
	def new
		@section = Section.new
	end
	
	def create
		@section = Section.new(section_params) 
		@category = Category.find_by(id: params["cat"].first)
		@section.category = @category
  		if @section.save
			redirect_to library_category_section_path(@library, @category, @section)
  		else 
    		render 'new' 
  		end 
	end

	def edit
		@section = Section.find(params[:id])
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
		def new_section
			@section = Section.new
			@section.category = @category
		end
end
