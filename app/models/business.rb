class Business < ApplicationRecord
  belongs_to :user

  validates :title, :status, presence: true
  validates :status, inclusion: { in: %w(start),message: " 出勤を登録していないと退勤を入力できません" }, on: :create

  enum status: { start: 0, end: 1 }

  def toggle_status!
    if start?
      end!
    else
      start!
    end
  end

  include CommonModule

  validate :businesses_count_must_be_within_limit, on: :create
  MAX_BUSINESSES_COUNT = 2
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  def businesses_count_must_be_within_limit
    # unless user.try(:admin?)
    errors.add(:created_at, " 出勤状況登録は1日#{MAX_BUSINESSES_COUNT}回までです ") if user.businesses.count >= MAX_BUSINESSES_COUNT
    # && created_at.strftime("%m-%d") == Date.current.strftime("%m-%d")
    end
  end
