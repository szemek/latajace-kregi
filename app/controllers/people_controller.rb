class PeopleController < ApplicationController
  def index
    search = ProfileSearch.new(search_params)
    profiles = ProfileDecorator.decorate_collection(search.results)
    tags  = Tag.order(:name)
    circles = Circle.order(:position)

    render :index, locals: {profiles: profiles, search: search, circles: circles, tags: tags, feature: feature}
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
