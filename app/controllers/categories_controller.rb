class CategoriesController < ApplicationController
	
	before_action :require_user, only: [:index]
	before_action :require_admin, only: [:new, :create]

	def index
	end
	
	def new
		@category = Category.new
	end
	
	def create
		@category = Category.new(category_params) 
  		if @category.save 
			redirect_to '/'
  		else 
    		render 'new' 
  		end 
	end
	
	private
		def category_params
			params.require(:category).permit(:name)
		end
	
end
