class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :circle

  mount_uploader :photo, PhotoUploader
end
