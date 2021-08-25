class Work < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  validates :start_time, presence: true
  validates :status, presence: true

  enum status: { false: 0, true: 1 }

  def toggle_status!
    if false?
      true!
    else
      false!
    end
  end

  validate :date_check
  def date_check
    if start_time.present?
      errors.add(:start_time, 'は今日以降の日付を選択してください') if start_time  < Date.yesterday
    end
  end
end
