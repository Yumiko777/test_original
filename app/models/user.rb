class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, length: { maximum: 30}

  has_many :teams, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :member_teams, through: :members, source: :team
  has_many :works, dependent: :destroy

  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :businesses, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "ゲスト"
    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "管理者"
      user.admin = true
      # user.save
    end
  end

  enum admin: { 一般: false, 管理者: true }
end
