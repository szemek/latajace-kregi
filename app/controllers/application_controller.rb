class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale
  before_filter :authorize_admin, if: :admin_panel?

  def set_locale
    I18n.locale = :en if admin_panel?
  end

  def current_locale
    I18n.locale || :en
  end

  helper_method :current_locale

  def admin_panel?
    request.path.start_with?('/admin')
  end

  def admin?
    current_user.try(:admin?)
  end

  helper_method :admin?

  def authorize_admin
    redirect_to(root_path) unless admin?
  end
end
