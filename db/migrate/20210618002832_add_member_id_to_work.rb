class AddMemberIdToWork < ActiveRecord::Migration[5.2]
  def change
    add_reference :works, :member, foreign_key: true
  end
end
