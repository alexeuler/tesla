# -*- coding: utf-8 -*- 
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :admin?
  before_action :set_view_params

  protected

  def set_view_params
    @crumbs={'Главная'=>root_path}
  end

  def admin?
    user_signed_in? && current_user.admin?
  end

  def require_admin
    render text: "Admin privileges required." unless admin?
  end

end
