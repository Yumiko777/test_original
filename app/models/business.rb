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

  # validate :status_check
  # def status_check
  #   errors.add(:status, " 出勤を登録していないと退勤を入力できません") if status == 'end'
  # end

  # validate :created_at_check
  # def created_at_check
  #   errors.add(:created_at, " できません") if created_at ==Date.current && created_at.count > 1
  # end
  def self.today
    where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  MAX_BUSINESSES_COUNT = 2
  validate :businesses_count_must_be_within_limit, on: :create
  private
  def businesses_count_must_be_within_limit
    if self.today
    unless user.try(:admin?)
    errors.add(:created_at, "できません: #{MAX_BUSINESSES_COUNT}") if user.businesses.count >= MAX_BUSINESSES_COUNT
    # && created_at.strftime("%m-%d") == Date.current.strftime("%m-%d")
    end
  end
  end
end
