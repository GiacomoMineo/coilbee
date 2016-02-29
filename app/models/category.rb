class Category < ActiveRecord::Base	
	has_many :sections
	has_many :entries, :through => :sections
	belongs_to :library
	
	extend FriendlyId
  	friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    name_changed? || super
  end
  
	validates_presence_of :name
end
