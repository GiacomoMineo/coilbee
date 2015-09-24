class PagesController < ApplicationController
	def index
		if user_signed_in?
			redirect_to libraries_path
		end
	end
end
