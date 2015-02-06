class PeopleController < ApplicationController
  def index
    search = ProfileSearch.new(search_params)
    profiles = ProfileDecorator.decorate_collection(search.results)
    skills = SkillFetcher.all
    interests = InterestFetcher.all
    circles = Circle.order(:position)

    render :index, locals: {
      profiles: profiles, search: search, circles: circles, feature: feature,
      skills: skills, interests: interests
    }
  end

  def show
    @person = Profile.find(params[:id])
  end

  private

  def search_params
    @search_params ||= params.delete(:profile_search) || {}
  end

  def feature
    @feature ||= Rollout.new(Feature)
  end
end
