class ProfilesController < ApplicationController
  def edit
    @profile = Profile.find_or_create_by(user_id: current_user.id)
  end
end
