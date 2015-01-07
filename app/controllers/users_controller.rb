class UsersController < ApplicationController
  def check
    user = User.find_by_email(params[:user][:email])

    if user.present?
      redirect_to(new_user_session_path)
    else
      redirect_to(new_user_registration_path)
    end
  end
end
