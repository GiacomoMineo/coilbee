class Tag < ActiveRecord::Base
	has_and_belongs_to_many :entries

	def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
		where("name like ?", "%#{query}%") 
	end
end
