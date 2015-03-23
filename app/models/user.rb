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

  delegate :fullname, to: :profile, allow_nil: true
end
