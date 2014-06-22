class PeopleController < ApplicationController
  def index
    @people = Profile.all
  end
end
