class MembersController < ApplicationController
  def index
    search = ProfileSearch.new(search_params)
    results = search.results.page(params[:page])
    profiles = ProfileDecorator.decorate_collection(results)
    skills = SkillFetcher.all
    interests = InterestFetcher.all
    circles = CircleFetcher.all

    render :index, locals: {
      profiles: profiles, search: search, circles: circles,
      skills: skills, interests: interests
    }
  end

  def show
    begin
      @person = ProfileDecorator.decorate(User.find(params[:id]))
    rescue ActiveRecord::RecordNotFound
      redirect_to(members_path)
    end
  end

  private

  def search_params
    params.delete(:search) || {seed: seed}
  end

  def seed
    rand(1..1_000_000)
  end
end
