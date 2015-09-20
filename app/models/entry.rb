class Entry < ActiveRecord::Base
	
	acts_as_votable

	belongs_to :section
	has_and_belongs_to_many :tags
	
	validates_presence_of :section, :title, :link, :description
	validates_format_of :link, :with => URI::regexp
end
