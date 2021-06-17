class Team < ApplicationRecord
  belongs_to :user

  has_many :members, dependent: :destroy
  has_many :member_users, through: :members, source: :user

  def is_member?(target_user)
    self.member_users.select { |user| user.id == target_user.id }.length > 0
  end
end
