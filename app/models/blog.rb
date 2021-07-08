class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title,  presence: true
  validates :content, presence: true

  scope :latest, -> (number = 7){order(created_at: :desc).limit(number)}
end
