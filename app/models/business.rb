class Business < ApplicationRecord
  validates :title,  presence: true
  validates :status, presence: true

  enum status: { start: 0,  end: 1 }

  def toggle_status!
    if start?
      end!
    else
      start!
    end
  end
end
