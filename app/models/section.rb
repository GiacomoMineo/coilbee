class Section < ActiveRecord::Base
	belongs_to :category
	has_many :entries

	extend FriendlyId
  	friendly_id :uniqueslug, use: [:slugged, :finders]
	
	def uniqueslug
		"#{category.name}-#{name}"
	end
	validates_presence_of :name, :category
end
