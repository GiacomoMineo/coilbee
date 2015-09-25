authorization do
  role :guest do
    # add permissions for guests here, e.g.
    # has_permission_on :conferences, :to => :read
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :authorization_usages, :to => :read
  end
  
  role :user do
		includes :guest
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
		
		# may accept or decline suggestions he received
		has_permission_on :suggestions, :to => [:accept, :destroy] do 
			if_attribute :receiver => is {user}
		end
	end
  
  role :admin do
		includes :user
		has_permission_on [:libraries, :categories, :sections, :entries, :tags, :suggestions], :to => :manage
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
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
