class InterestFetcher
  def self.all
    new.all
  end

  def all
    Tag.where(id: tags).order(:name)
  end

  def tags
    Tagging.where(context: 'interests').select(:tag_id).distinct.pluck(:tag_id)
  end
end
