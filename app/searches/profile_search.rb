class ProfileSearch < Searchlight::Search
  search_on Profile.filled.joins(:user)

  searches :circle_id, :skills, :interests

  def search_circle_id
    search.where(circle_id: circle_id)
  end

  def search_skills
    search.tagged_with(skills, on: :skills, any: true)
  end

  def search_interests
    search.tagged_with(interests, on: :interests, any: true)
  end
end
