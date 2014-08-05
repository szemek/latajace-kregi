class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def circles
    @_circles ||= Circle.order(:name)
  end

  helper_method :circles
end
