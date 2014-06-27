class Event < ActiveRecord::Base
  belongs_to :circle
  has_many :rsvps
  has_many :users, through: :rsvps
end
