class Entry < ActiveRecord::Base
	# prepares the entry for being shown to current_user
	scope :for_user, ->(user) {
		includes(:tags)
		.with_read_marks_for(user)
		.order(cached_votes_score: :desc)
	}

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
