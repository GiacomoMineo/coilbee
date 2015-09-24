class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_categories_for_menu
  helper_method :current_user 

  private

  def set_categories_for_menu
    @categories = Category.all
  end

#  def current_user 
 # 	@current_user ||= User.find(session[:user_id]) if session[:user_id] 
  #end

  def require_user 
  	redirect_to '/login' unless current_user 
  end

  def require_editor
  	redirect_to '/' unless current_user.editor? 
  end

  def require_admin
  	redirect_to '/' unless current_user.admin? 
  end

  def after_sign_in_path_for(resource)
    libraries_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end


end
