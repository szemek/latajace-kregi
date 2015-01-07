class Api::UsersController < Api::BaseController
  def check
    user = User.find_by_email(params[:user][:email])

    if user.present?
      render json: {action: 'signin'}
    else
      render json: {action: 'signup'}
    end
  end
end
