class ProfilesController < ApplicationController
  def edit
    @profile = Profile.find_or_create_by(user: current_user)
  end

  def update
    profile = current_user.profile
    profile.assign_attributes(profile_params)
    profile.save

    redirect_to(edit_profile_path)
  end

  private

  def profile_params
    params.require(:profile).permit(*profile_fields)
  end

  def profile_fields
    [:fullname, :bio, :photo, :activity, :circle_id, :skill_list, :interest_list]
  end
end
