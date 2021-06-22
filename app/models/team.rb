class Team < ApplicationRecord
  attr_accessor :selected_user_ids
  belongs_to :user

  has_many :members, dependent: :destroy
  has_many :member_users, through: :members, source: :user

  validates :name, presence: true

  def is_member?(target_user)
    self.member_users.select { |user| user.id == target_user.id }.length > 0
  end

  def member_user_ids
    self.member_users.map(&:id)
  end

  def none_member_users
    ids = self.member_user_ids
    User.all.select { |user| !ids.include?(user.id)  }
  end

  def create_members
    self.safe_selected_user_ids.each do |id|
      Member.find_by(user_id: id, team_id: self.id) || Member.create(user_id: id, team_id: self.id)
    end
    self.selected_user_ids = []
  end

  def safe_selected_user_ids
    self.selected_user_ids.select { |id| id != "" && id.to_i != 0 }
  end
end
