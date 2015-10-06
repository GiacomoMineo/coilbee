class Users::ToggleController < ApplicationController

  def toggle_edit
    #current_user.update_attributes(mode: 1)
    #current_user.mode = 1
    current_user.edit!
    render '/'
  end

  def toggle_read
    #current_user.update_attributes(mode: 0)
    #current_user.mode = 0
    #redirect_to request.referer
    current_user.read!
    render '/'
  end

end