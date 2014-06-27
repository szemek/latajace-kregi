class Heroine < ActiveRecord::Base
  belongs_to :circle

  mount_uploader :photo, PhotoUploader
end
