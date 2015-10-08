class TogglesController < ApplicationController
	#filter_access_to :all
	def toggle_edit
    current_user.edit!
    redirect_to request.referer || '/'
  end

  def toggle_read
    current_user.read!
    redirect_to request.referer || '/'
  end
end
