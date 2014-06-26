class PersonController < ApplicationController
  def show
    @person = Profile.find(params[:id])
  end
end
