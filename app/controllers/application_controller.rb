class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale

  def set_locale
    I18n.locale = :en if admin_area?
  end

  def current_locale
    I18n.locale || :en
  end

  helper_method :current_locale

  def admin_area?
    request.path.include?('/admin')
  end
end
