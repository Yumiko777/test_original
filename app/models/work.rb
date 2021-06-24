class Work < ApplicationRecord
  belongs_to :user

  validates :title,  presence: true
  validates :content,  presence: true, length: { maximum: 255 }
  validates :start_time,  presence: true

  enum status: { false: 0,  true: 1 }
  # enum status: { 未済: 0,  済: 1 }
end
