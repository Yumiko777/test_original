class Member < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :works, dependent: :destroy
end
