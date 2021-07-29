class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable,:omniauthable, omniauth_providers: [:google_oauth2]
  validates :username, presence: true, length: { maximum: 30 }

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
      user.username = 'ゲスト'
      user.uid = SecureRandom.uuid
    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = '管理者'
      user.admin = true
      user.uid = SecureRandom.uuid
    end
  end

  enum admin: { 一般: false, 管理者: true }

  def self.ransackable_attributes(_auth_object = nil)
    %w[username]
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.new(email: auth.info.email,
                      provider: auth.provider,
                      uid:      auth.uid,
                      password: Devise.friendly_token[0, 20],
                                 )
    end
    user.save
    user
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
