class Entry < ActiveRecord::Base
	has_many :nests
	has_many :sections, through: :nests
end
