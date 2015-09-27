class Library < ActiveRecord::Base
	has_many :categories
	has_many :groups
	has_many :suggestions
	has_many :tags
	has_many :subscriptions
  	has_many :users, through: :subscriptions
  	belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"	
end
