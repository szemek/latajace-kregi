class OrganizersController < ApplicationController
  def index
    @organizers = Organizer.all
  end

  def show
    @organizer = Organizer.find(params[:id])
  end
end
