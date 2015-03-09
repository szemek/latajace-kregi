class OrganizersController < ApplicationController
  def index
    @organizers = ProfileDecorator.decorate_collection(Organizer.all)
  end

  def show
    @organizer = ProfileDecorator.decorate(Organizer.find(params[:id]))
  end
end
