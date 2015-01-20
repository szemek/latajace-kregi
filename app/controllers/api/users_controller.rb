class Api::UsersController < Api::BaseController
  def check
    user = User.find_by_email(email)

    if user.present?
      render json: {action: 'signin'}
    else
      render json: {action: 'signup'}
    end
  end

  private

  def email
    params[:user][:email].downcase
  end
end
