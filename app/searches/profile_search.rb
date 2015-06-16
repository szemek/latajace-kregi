class ProfileSearch < Searchlight::Search
  search_on proc { User.filled.includes(:circle) }

  searches :circle_id, :query, :skill, :interest, :seed

  def search_circle_id
    search.where(circle_id: circle_id)
  end

  def search_query
    fullname = User[:fullname]
    bio = User[:bio]
    activity = User[:activity]
    pattern = "%#{query}%"

    search.where(fullname.matches(pattern).or(bio.matches(pattern)).or(activity.matches(pattern)))
  end

  def search_skill
    search.tagged_with(skill, on: :skills, any: true)
  end

  def search_interest
    search.tagged_with(interest, on: :interests, any: true)
  end

  def search_seed
    search.order_by_rand(seed: seed)
  end
end
