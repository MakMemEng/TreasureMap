class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :affirmations, dependent: :destroy
  validates :username,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                                              format: { with: VALID_EMAIL_REGEX }
	def self.guest
		find_or_create_by!(username: 'Guest_User',email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
	end
end
