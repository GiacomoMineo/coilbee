class CategoriesController < ApplicationController
	before_action :new_category, :only => :new
	before_filter :set_library
	filter_resource_access

	def index
	end
	
	def new
	end
	
	def create
		@category = Category.new(category_params)
		@category.library = @library

		if @category.save 
			redirect_to library_path(@library)
		else 
			render 'new' 
		end 
	end

	def destroy
		@category = Category.find(params[:id]) #TODO delete recursively all sections and entries
		#@library = @category.library
		@category.destroy
		redirect_to library_path(@library), :notice => "The category has been deleted"
	end

	def edit
		@category = Category.find(params[:id])
		@library = @category.library
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(category_params)
			redirect_to library_path(@category.library), :notice => "The library has been edited"
		else
			render 'edit'
		end
	end
	
	private
		def category_params
			params.require(:category).permit(:name)
		end
		
		def new_category
			@category = Category.new
			@category.library = Library.find(params[:library_id])
		end
end
