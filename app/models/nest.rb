class Nest < ActiveRecord::Base
	belongs_to :section
	belongs_to :entry
end
