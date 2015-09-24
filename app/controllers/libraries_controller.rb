class LibrariesController < ApplicationController
	def index
		@libraries_own = Library.all.select{ |lib| lib.creator == current_user} 
		@libraries_followed = Library.all.select{ |lib| lib.users.include? current_user} 
		#@libraries = current_user
	end

	def show
		@library = Library.find(params[:id])
		@categories = @library.categories
	end

	def new
		@library_new = Library.new
	end

	def create
		@library_new = Library.new(library_params) 
		@library_new.creator = current_user
  		if @library_new.save 
				redirect_to '/' 
  		else 
    		render 'new' 
  		end 
	end

	def edit
		@library_to_edit = Library.find(params[:id])
	end

	def update
		@library_to_edit = Library.find(params[:id])
		if @library_to_edit.update_attributes(library_params)
			redirect_to '/', :notice => "The library has been edited"
		else
			render 'edit'
		end
	end

	def delete
		@library = Library.find(params[:id])
    	@library.destroy
    	redirect_to '/', :notice => "The library has been deleted"
	end

	private 
		def library_params
			params.require(:library).permit(:topic, :description)
		end


end
