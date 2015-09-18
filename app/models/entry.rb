class Entry < ActiveRecord::Base
	
	acts_as_votable

	belongs_to :section
	has_many :references
	has_many :tags, through: :references
	
	validates_presence_of :section, :title, :link, :description
	validates_format_of :link, :with => URI::regexp
end
