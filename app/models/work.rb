class Work < ApplicationRecord
  belongs_to :user

  validates :title,  presence: true
  validates :content,  presence: true, length: { maximum: 255 }
  validates :start_time,  presence: true
  enum status: { 未済: 0,  済: 1 }
  has_many :members, dependent: :destroy
  has_many :member_users, through: :members, source: :user
end
