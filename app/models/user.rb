class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true

  has_many :teams, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :member_teams, through: :members, source: :team
  has_many :works, dependent: :destroy

  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "ゲスト"
    end
  end
end
