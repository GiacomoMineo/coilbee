class Section < ActiveRecord::Base
	belongs_to :category
	has_many :nests
	has_many :entries, through: :nests
end
