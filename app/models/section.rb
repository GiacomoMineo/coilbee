class Section < ActiveRecord::Base
	belongs_to :category
	has_many :entries

	extend FriendlyId
  	friendly_id :name, use: [:slugged, :finders]
	
  def should_generate_new_friendly_id?
    name_changed? || super
  end
	
	validates_presence_of :name, :category
end
