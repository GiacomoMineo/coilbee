class Invitation < ActiveRecord::Base
	belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id" 
	belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
	belongs_to :library
end
