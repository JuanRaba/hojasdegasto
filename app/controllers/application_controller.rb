class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  check_authorization :unless => :is_devise_or_active_admin?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_path, alert: exception.message}
    end
  end

  protected

  def is_devise_or_active_admin?
    devise_controller? || active_admin_resource?
  end

  def active_admin_resource?
    self.class.ancestors.include? ActiveAdmin::BaseController
  end
end
