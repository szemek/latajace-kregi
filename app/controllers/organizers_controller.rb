class OrganizersController < ApplicationController
  def index
    @organizers = ProfileDecorator.decorate_collection(Organizer.all)
  end

  def show
    @organizer = Organizer.find(params[:id])
  end
end
