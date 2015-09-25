class Group < ActiveRecord::Base
	belongs_to :library
	has_many :entries
end
