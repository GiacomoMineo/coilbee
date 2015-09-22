class LibrariesController < ApplicationController
	def index
		@libraries = Library.all
		#@libraries = current_user
	end

	def show
		@library = Library.find(params[:id])
		@categories = @library.categories
	end

end
