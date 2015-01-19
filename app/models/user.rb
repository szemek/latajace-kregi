class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  def remember_me
    true
  end

  has_one :profile, dependent: :destroy
  has_many :rsvps
  has_many :events, through: :rsvps
  has_many :feedbacks

  delegate :fullname, to: :profile, allow_nil: true
end
