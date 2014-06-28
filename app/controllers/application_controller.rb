class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :all_circles

  def all_circles
    @all_circles = Circle.all.order(:name)
  end
end
