class Blog < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  include CommonModule
end
