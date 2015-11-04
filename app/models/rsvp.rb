class Rsvp < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  enum status: [:not_going, :going, :waiting]

  # dynamic definitions of scopes
  statuses.each do |status, value|
    scope status, -> { where(status: value).order(:updated_at) }
  end
end
