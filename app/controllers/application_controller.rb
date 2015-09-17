class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_categories_for_menu

  private

  def set_categories_for_menu
    @categories = Category.all
  end

end
