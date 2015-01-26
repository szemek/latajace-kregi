class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale
  before_filter :authorize_admin, if: :admin_area?

  def set_locale
    I18n.locale = :en if admin_area?
  end

  def current_locale
    I18n.locale || :en
  end

  helper_method :current_locale

  def admin_area?
    request.path.start_with?('/admin')
  end

  def authorize_admin
    redirect_to(root_path) if current_user.blank? || !current_user.admin?
  end
end
