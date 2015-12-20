class Api::HooksController < Api::BaseController
  def email
    render json: {}, status: :ok
  end
end
