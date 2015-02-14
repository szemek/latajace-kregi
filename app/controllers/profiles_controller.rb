class ProfilesController < ApplicationController
  def edit
    circles = Circle.all
    profile = Profile.find_or_create_by(user: current_user)

    gon.tags = Tag.order(:name).pluck(:name)

    render :edit, locals: {circles: circles, profile: profile}
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
    [:fullname, :bio, :activity, :circle_id, :webpage, :contact, :skill_list, :interest_list,
      :photo, :photo_crop => [:x, :y, :w, :h]]
  end
end
