class Feedback < ActiveRecord::Base

	validates_presence_of :name, :email, :subject, :content
end
