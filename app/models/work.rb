class Work < ApplicationRecord
  belongs_to :member

  validates :title,  presence: true
  validates :content,  presence: true, length: { maximum: 255 }
  validates :start_time,  presence: true
  enum status: { 未済: 0,  済: 1 }
end
