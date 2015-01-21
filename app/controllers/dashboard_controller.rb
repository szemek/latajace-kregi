class DashboardController < ApplicationController
  def index
    redirect_to(start_path)
  end
end
