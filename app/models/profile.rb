class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :circle

  mount_uploader :photo, PhotoUploader

  def photo_crop
    @photo_crop || Hashie::Mash.new
  end

  def photo_crop=(value)
    @photo_crop = Hashie::Mash.new(value)
  end

  # methods:
  # photo_crop_x, photo_crop_y, photo_crop_w, photo_crop_h
  %w[x y w h].each do |attribute|
    define_method("photo_crop_#{attribute}") do
      photo_crop.send(attribute).to_i
    end
  end

  acts_as_ordered_taggable_on :skills, :interests

  scope :filled, -> { where('fullname IS NOT NULL AND LENGTH(fullname) > 0') }

  delegate :code, to: :circle, allow_nil: true
  delegate :events, to: :user, allow_nil: true
end
