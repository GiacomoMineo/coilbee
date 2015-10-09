authorization do

  role :guest do
  	has_permission_on :libraries, :to => :show
  	has_permission_on :sections, :to => :read
  	has_permission_on :tags, :to => :read
  end
  
  role :user do
		includes :guest

		#may create new libraries
		has_permission_on :libraries, :to => [:create, :browse]

		has_permission_on :libraries, :to => [:manage, :show_suggestions] do
			if_attribute :moderators => contains {user}
		end 

		# may view libraries he is subscribed to...
		has_permission_on :libraries, :to => :read do
			if_attribute :users => contains {user}
		end
		# ... with all their categories...
		has_permission_on :categories, :to => :read do
			if_permitted_to :read, :library
		end
		# ... and sections
		has_permission_on :sections, :to => :read do
			if_permitted_to :read, :category
		end
		# ... and tags
		has_permission_on :tags, :to => :read do
			if_permitted_to :read, :library
		end
		# may rate entries and mark them as read
		has_permission_on :entries, :to => [:rate, :read] do
			if_permitted_to :read, :section
		end
		# may suggest new entries
		has_permission_on :entries, :to => :suggest


		
		# may accept or decline suggestions he received
		has_permission_on :invitations, :to => [:accept, :destroy] do 
			if_attribute :receiver => is {user}
		end
		# may try to create invites (TODO: Fix, as this allows everyone to invite)
		has_permission_on :invitations, :to => :new
		# may invite users to libraries he created
		has_permission_on :invitations, :to => :create do
			if_permitted_to :edit, :library
		end
		
		# may manage libraries he created...
		has_permission_on :libraries, :to => [:manage, :show_suggestions] do
			if_attribute :creator => is {user}
		end
		# ... and all their categories
		has_permission_on :categories, :to => :manage do
			if_permitted_to :edit, :library
		end
		# ... and sections
		has_permission_on :sections, :to => :manage do
			if_permitted_to :edit, :category
		end
		# ... and entries
		has_permission_on :entries, :to => [:manage, :accept, :rate] do
			if_permitted_to :edit, :section
		end	
	end

	role :moderator do
		includes :user

	end
  
  role :admin do
		includes :user
		has_permission_on :toggles, :to => [:toggle_edit, :toggle_read]
		has_permission_on [:libraries, :categories, :sections, :entries, :tags, :invitations], :to => :manage
		has_permission_on :libraries, :to => [:show_suggestions]
		has_permission_on :entries, :to => [:accept, :rate]
	end
	
  # permissions on other roles, such as
  # role :admin do
  #   has_permission_on :conferences, :to => :manage
  # end
  # role :user do
  #   has_permission_on :conferences, :to => [:read, :create]
  #   has_permission_on :conferences, :to => [:update, :delete] do
  #     if_attribute :user_id => is {user.id}
  #   end
  # end
  # See the readme or GitHub for more examples
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :rate, :includes => [:upvote, :downvote]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
