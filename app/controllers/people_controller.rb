class PeopleController < ApplicationController
  def index
    search = ProfileSearch.new(search_params)
    profiles = ProfileDecorator.decorate_collection(search.results)
    skills = SkillFetcher.all
    interests = InterestFetcher.all
    circles = CircleFetcher.all

    render :index, locals: {
      profiles: profiles, search: search, circles: circles,
      skills: skills, interests: interests
    }
  end

  def show
    @person = Profile.find(params[:id])
  end

  private

  def search_params
    params.delete(:search) || {}
  end
end
