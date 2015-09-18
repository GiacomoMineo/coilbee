class Entry < ActiveRecord::Base
	
	acts_as_votable

	belongs_to :section
	has_many :references
	has_many :tags, through: :references
end
