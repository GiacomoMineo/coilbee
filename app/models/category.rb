class Category < ActiveRecord::Base
	has_many :sections
	belongs_to :library
	validates_presence_of :name
end
