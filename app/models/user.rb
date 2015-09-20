class User < ActiveRecord::Base

	has_secure_password

	def editor?
		self.role == 'editor'
	end

	def admin?
		self.role == 'admin'
	end

	validates_presence_of :first_name, :last_name, :user_name, :email, :password_digest	
	validates_uniqueness_of :user_name, :email, case_sensitive: false 
	validates_format_of :email, with: /[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/ 
end
