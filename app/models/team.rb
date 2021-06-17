class Team < ApplicationRecord
  belongs_to :user

  has_many :members, dependent: :destroy
  has_many :member_users, through: :members, source: :user
end
