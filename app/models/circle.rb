class Circle < ActiveRecord::Base
  has_many :events, dependent: :delete_all

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [:name]
  end
end
