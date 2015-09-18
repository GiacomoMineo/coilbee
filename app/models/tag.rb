class Tag < ActiveRecord::Base
	has_many :references
	has_many :entries, through: :references
end
