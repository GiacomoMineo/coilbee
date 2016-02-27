class Section < ActiveRecord::Base
	belongs_to :category
	has_many :entries

	scope :in_library, ->(library) do
		where('category_id IN (?)', library.categories.select(:id))
	end

	extend FriendlyId
  	friendly_id :name, use: [:slugged, :finders]
	
  def should_generate_new_friendly_id?
    name_changed? || super
	end
	
	validates_presence_of :name, :category
end
