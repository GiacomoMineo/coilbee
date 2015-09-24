class Library < ActiveRecord::Base
	has_many :categories
	has_many :subscriptions
  	has_many :users, through: :subscriptions
  	belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"	
end
