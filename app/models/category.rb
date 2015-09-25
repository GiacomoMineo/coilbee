class Category < ActiveRecord::Base
	default_scope { includes(:sections) }
	
	has_many :sections
	belongs_to :library
	validates_presence_of :name
end
