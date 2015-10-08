class LibrariesController < ApplicationController
	before_action :new_library, :only => :approve
	filter_resource_access

	def index
		@libraries_own = current_user.libraries_created
		@libraries_followed = current_user.libraries.select { |lib| lib.creator != current_user}
		@suggestions = current_user.suggestions_received
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

		@group_read	 = Group.new(:name => "Read")
		@group_watch = Group.new(:name => "Watch")
		@group_learn = Group.new(:name => "Learn")
		@group_make = Group.new(:name => "Make")

		@library_new.groups.push(@group_read)
		@library_new.groups.push(@group_watch)
		@library_new.groups.push(@group_learn)
		@library_new.groups.push(@group_make)


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

	def destroy
		@library = Library.find(params[:id])
		@suggestions = Suggestion.all.select{ |sug| sug.library == @library}

		@suggestions.each do |sug|
			sug.destroy
		end
		
    	@library.destroy
    	redirect_to '/', :notice => "The library has been deleted"
	end

	def approve
		@library = Library.find_by(id: params[:lib])

		@sections = []
		@library.categories.each {|cat| @sections.push(cat.sections)}
		@sections.flatten!

		@entries = []
		@sections.each {|sec| @entries.push(sec.entries) }
		@groups = @library.groups
		@entries = @entries.flatten.select{|e| e.accepted == false}
	end

	private
		def library_params
			params.require(:library).permit(:topic, :description)
		end
		def new_library
			@library = Library.new
		end

end
