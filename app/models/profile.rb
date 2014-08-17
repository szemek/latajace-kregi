class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :circle

  mount_uploader :photo, PhotoUploader

  acts_as_taggable_on :skills, :interests

  delegate :code, to: :circle, allow_nil: true
  delegate :events, to: :user, allow_nil: true
end
