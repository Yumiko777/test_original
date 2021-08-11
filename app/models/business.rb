class Business < ApplicationRecord
  belongs_to :user

  validates :title, :status, presence: true

  include CommonModule

  def toggle_status!
    finish! if status == 'start'
  end

  validate :status_check, on: :create
  def status_check
    errors.add(:status, ' 出勤を登録していないと退勤を入力できません') if status == 'finish'
  end

  MAX_BUSINESSES_COUNT = 1
  enum status: { start: 0, finish: 1 }
  validate :businesses_count_must_be_within_limit, on: :create
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  def businesses_count_must_be_within_limit
    if status == 'start' && user.businesses.count >= MAX_BUSINESSES_COUNT
      errors.add(:status, " 出勤登録は1日#{MAX_BUSINESSES_COUNT}回のみです。間違えて入力した場合は削除してください")
    elsif status == 'finish'
      errors.add(:status, ' 出勤から退勤へ変更するには、出勤状況一覧の出勤をクリックしてください ')
    end
  end

  def self.created_at_check
    puts "こんにちは"

    # Business.all.each do |business|
    # # if business.created_at < Date.today
    # puts "こんにちは"
    #   business.destroy if business.created_at < Time.current
    # end
  end
end
