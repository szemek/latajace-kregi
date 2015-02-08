class Circle < ActiveRecord::Base
  has_many :events, dependent: :delete_all
  has_many :profiles
  has_many :heroines

  default_scope { where(visible: true) }

  validates :position, presence: true

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [:name]
  end
end
