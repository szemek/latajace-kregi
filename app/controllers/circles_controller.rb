class CirclesController < ApplicationController
  def show
    @circle = Circle.find(params[:id])
  end
end
