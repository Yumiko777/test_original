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
end
