class Event < ActiveRecord::Base
  belongs_to :circle
  has_many :rsvps, dependent: :delete_all
  has_many :users, through: :rsvps
end
