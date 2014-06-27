class Heroine < ActiveRecord::Base
  belongs_to :circle

  mount_uploader :photo, PhotoUploader

  delegate :code, to: :circle, allow_nil: true
end
