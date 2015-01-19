class CirclesController < ApplicationController
  def index
    circles = CircleDecorator.decorate_collection(Circle.order(:position))

    render :index, locals: {circles: circles}
  end

  def show
    @circle = Circle.find(params[:id])
    @events = @circle.events
  end
end
