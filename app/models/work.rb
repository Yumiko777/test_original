class Work < ApplicationRecord
  validates :title,  presence: true
  validates :content,  presence: true, length: { maximum: 255 }
  enum status: { 未済: 0,  済: 1 }
end
