class DashboardController < ApplicationController
  def index
    redirect_to(circles_path)
  end
end
