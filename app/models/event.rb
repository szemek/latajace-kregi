class Event < ActiveRecord::Base
  belongs_to :circle
  has_many :rsvps, dependent: :delete_all
  has_many :users, through: :rsvps

  validates :name, presence: true
  validates :starting_at, presence: true
  validates :circle, presence: true
  validates :quantity, presence: true

  scope :visible, -> { where(visible: true) }
end
