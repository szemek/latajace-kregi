class Heroine < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
end
