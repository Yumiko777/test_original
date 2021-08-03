class Business < ApplicationRecord
  belongs_to :user

  validates :title, :status, presence: true

  # def toggle_status!
  #   if start?
  #     finish!
  #   else
  #     start!
  #   end
  # end
  def toggle_status!
    if status == "start"
      finish!
    # else
    #   start!
    end
  end


  include CommonModule

  MAX_BUSINESSES_COUNT = 1
  enum status: { start: 0, finish: 1 }
  validate :businesses_count_must_be_within_limit, on: :create
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  def businesses_count_must_be_within_limit
    if self.status == "start" && user.businesses.count > MAX_BUSINESSES_COUNT
      errors.add(:status, " 出勤登録は1日#{MAX_BUSINESSES_COUNT}回のみです。間違えて入力した場合は削除してください")
    elsif self.status == "finish" && user.businesses.count > MAX_BUSINESSES_COUNT
      errors.add(:status, " 退勤登録は1日#{MAX_BUSINESSES_COUNT}回のみです。間違えて入力した場合は削除してください")
    end
  end

  def self.created_at_check
    Business.all.each do |business|
      if business.created_at < Date.today
        business.destroy
      end
    end
  end
end
