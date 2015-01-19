class PeopleController < ApplicationController
  def index
    @people = ProfileDecorator.decorate_collection(Profile.filled.joins(:user))
  end

  def show
    @person = Profile.find(params[:id])
  end
end
