class CirclesController < ApplicationController
  def index
    circles = CircleFetcher.all

    render :index, locals: {circles: circles}
  end

  def show
    @circle = Circle.find_by(slug: params[:id])
    @events = @circle.events.visible.order(created_at: :desc)
  end
end
