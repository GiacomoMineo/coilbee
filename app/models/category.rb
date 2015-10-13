class Category < ActiveRecord::Base	
	has_many :sections
	belongs_to :library
	
	extend FriendlyId
  	friendly_id :name, use: [:slugged, :finders]

	validates_presence_of :name
end
