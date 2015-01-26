class LandingController < ApplicationController
  def index
    redirect_to(start_path) if user_signed_in?
  end
end
