class LibrariesController < ApplicationController
	before_action :new_library, :only => [:approve, :edit, :browse]
	filter_resource_access

	def index
		@libraries_own = current_user.libraries_created
		@libraries_followed = current_user.libraries.select { |lib| lib.creator != current_user}
		@invitations = current_user.invitations_received
	end

	def browse
	end

	def show
		@library = Library.friendly.find(params[:id])
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
		@library_to_edit = Library.friendly.find(params[:id])
	end

	def update
		@library_to_edit = Library.friendly.find(params[:id])
		if @library_to_edit.update_attributes(library_params)
			redirect_to '/', :notice => "The library has been edited"
		else
			render 'edit'
		end
	end

	def destroy
		@library = Library.friendly.find(params[:id])
		@invitations = Invitation.all.select{ |sug| sug.library == @library}

		@invitations.each do |invite|
			invite.destroy
		end
		
    	@library.destroy
    	redirect_to '/', :notice => "The library has been deleted"
	end
	
	def suggest_entry
		@library = Library.friendly.find(params[:id])
		
		@sections = []
		@library.categories.each do |cat|
			@sections.push(cat.sections)
		end
		@sections = @sections.flatten
		
		@groups = @library.groups
		@entry = Entry.new
	end

	def show_suggestions
		@library = Library.friendly.find(params[:id])

		@sections = []
		@library.categories.each {|cat| @sections.push(cat.sections)}
		@sections.flatten!

		@entries = []
		@sections.each {|sec| @entries.push(sec.entries) }
		@groups = @library.groups
		@entries = @entries.flatten.select{|e| e.accepted == false}
	end

	def subscribe
		@library = Library.friendly.find(params[:id])
		@library.users.push(current_user)
		redirect_to request.referer || '/'
	end

	def unsubscribe
		@library = Library.friendly.find(params[:id])
		@library.update_attributes(users: @library.users - [current_user])
		redirect_to request.referer || '/'
	end

	private
		def library_params
			params.require(:library).permit(:topic, :description, :public, {:moderator_ids => []})
		end
		def new_library
			@library = Library.new
		end

end
