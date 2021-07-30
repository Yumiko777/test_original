class Business < ApplicationRecord
  belongs_to :user

  validates :title, :status, presence: true

  enum status: { start: 0, end: 1 }

  def toggle_status!
    if start?
      end!
    else
      start!
    end
  end

  include CommonModule

  validate :status_check, on: :create
  def status_check
    errors.add(:status, " 出勤を登録していないと退勤を入力できません") if status == 'end'
  end

  validate :businesses_count_must_be_within_limit, on: :create
  MAX_BUSINESSES_COUNT = 1
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  def businesses_count_must_be_within_limit
    errors.add(:created_at, " 出勤状況登録は1日#{MAX_BUSINESSES_COUNT}回までです。出勤から退勤へ変更するには、出勤状況一覧の出勤をクリックしてください ") if user.businesses.count >= MAX_BUSINESSES_COUNT
    end
  end
