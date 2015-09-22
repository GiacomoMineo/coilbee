class Library < ActiveRecord::Base
	has_many :categories
	has_many :subscriptions
  	has_many :users, through: :subscriptions
	
end
