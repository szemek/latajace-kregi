class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  def remember_me
    true
  end

  has_one :profile, dependent: :destroy
  has_many :rsvps, dependent: :delete_all
  has_many :events, through: :rsvps
  has_many :feedbacks, dependent: :delete_all

  belongs_to :circle

  validates :fullname, presence: true

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

  delegate :code, to: :circle, allow_nil: true

  scope :filled, -> { where('fullname IS NOT NULL AND LENGTH(fullname) > 0') }
end
