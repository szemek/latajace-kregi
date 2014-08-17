class TagsController < ApplicationController
  respond_to :json

  def index
    tags = Tag.for_term(params[:term]).pluck(:name)
    respond_with(tags)
  end
end
