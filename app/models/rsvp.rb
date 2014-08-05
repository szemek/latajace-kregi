class Rsvp < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  scope :going, -> { where(going: true) }
end
