class PostgreSQL::Circle < ActiveRecord::Base
  has_many :events, dependent: :delete_all
  has_many :users
  has_many :heroines

  scope :visible, -> { where(visible: true) }

  validates :position, presence: true

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [:name]
  end
end
