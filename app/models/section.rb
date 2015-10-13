class Section < ActiveRecord::Base
	belongs_to :category
	has_many :entries

	extend FriendlyId
  	friendly_id :name, use: [:slugged, :finders]
	
	validates_presence_of :name, :category
end
