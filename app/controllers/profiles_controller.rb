class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    circles = Circle.visible

    gon.tags = Tag.order(:name).pluck(:name)

    render :edit, locals: {circles: circles, profile: current_user}
  end

  def update
    current_user.assign_attributes(profile_params)
    current_user.save

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
