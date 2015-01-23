class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :circle

  mount_uploader :photo, PhotoUploader

  acts_as_ordered_taggable_on :skills, :interests

  scope :filled, -> { where('fullname IS NOT NULL AND LENGTH(fullname) > 0') }

  delegate :code, to: :circle, allow_nil: true
  delegate :events, to: :user, allow_nil: true
end
