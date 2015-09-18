class Section < ActiveRecord::Base
	belongs_to :category
	has_many :entries
	
	validates_presence_of :name, :category
end
