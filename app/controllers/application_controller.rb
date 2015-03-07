class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize_admin, if: :admin_panel?

  def admin_panel?
    request.path.start_with?('/admin')
  end

  def admin?
    current_user.try(:admin?)
  end

  helper_method :admin?

  def current_profile
    current_user.profile.decorate
  end

  helper_method :current_profile

  def authorize_admin
    redirect_to(root_path) unless admin?
  end
end
