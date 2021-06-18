class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true

  has_many :teams, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :member_teams, through: :members, source: :team

  def works
    @works = Work.none
    self.members.each do |member|
      @works.merge(member.works)
    end
    return @works
  end
end
