class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :pictures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories
  has_many :messages, dependent: :destroy
  has_many :conversations_users, dependent: :destroy
  has_many :conversations, through: :conversations_users
  devise :database_authenticatable, :registerable,
         :lockable, :recoverable, :rememberable,
         :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  def follow_category!(category)
    user_categories.create!(category: category)
  end

  def unfollow_category!(category)
    user_categories.find_by(category: category).destroy!
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by_email(data["email"])

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(email: data["email"],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end

end
