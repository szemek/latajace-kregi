class PeopleController < ApplicationController
  def index
    @people = Profile.all.joins(:user)
  end
end
