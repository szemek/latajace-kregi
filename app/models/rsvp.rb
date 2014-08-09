class Rsvp < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  enum status: [:not_going, :going, :waiting]

  scope :going, -> { where(going: true) }
  scope :waiting, -> { where(going: false) }
end
