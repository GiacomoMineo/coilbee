class Entry < ActiveRecord::Base
	# prepares the entry for being shown, including read marks
	# if user != nil
	scope :prepare_for, ->(user) do
		includes(:tags, :group)
		.order(cached_votes_score: :desc, updated_at: :desc, created_at: :asc)
		.possibly_with_read_marks(user)
	end
	scope :possibly_with_read_marks, ->(user) do
		with_read_marks_for(user) if user
	end

	acts_as_votable
	acts_as_readable :on => :created_at

	belongs_to :group
	belongs_to :section
	has_and_belongs_to_many :tags
	
	validates_presence_of :section, :title, :link, :description, :group
	validates_format_of :link, :with => URI::regexp
	
	def rating
		cached_votes_score
	end
end
