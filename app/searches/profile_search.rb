class ProfileSearch < Searchlight::Search
  search_on proc { User.filled.includes(:circle) }

  searches :circle_id, :skill, :interest, :seed

  def search_circle_id
    search.where(circle_id: circle_id)
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
