class Business < ApplicationRecord
  validates :title, :status, presence: true

  enum status: { start: 0,  end: 1 }

  def toggle_status!
    if start?
      end!
    else
      start!
    end
  end
end
