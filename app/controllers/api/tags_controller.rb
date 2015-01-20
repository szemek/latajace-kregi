class Api::TagsController < Api::BaseController
  def index
    render json: Tag.all
  end
end
