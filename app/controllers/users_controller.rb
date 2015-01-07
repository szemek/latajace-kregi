class UsersController < ApplicationController
  def signin_or_signup
    user = User.find_by_email(params[:user][:email])
  end
end
