class Entry < ActiveRecord::Base
	acts_as_votable
	acts_as_readable :on => :created_at

	belongs_to :section
	has_and_belongs_to_many :tags

	enum group: [ :read, :learn, :watch, :make]
	
	validates_presence_of :section, :title, :link, :description
	validates_format_of :link, :with => URI::regexp
	
	def rating
		cached_votes_score
	end
end
