class PeopleController < ApplicationController
  def index
    @people = Profile.filled.joins(:user)
  end

  def show
    @person = Profile.find(params[:id])
  end
end
