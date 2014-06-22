class CirclesController < ApplicationController
  def show
    @circle = Circle.find(params[:id])
    @events = @circle.events
  end
end
