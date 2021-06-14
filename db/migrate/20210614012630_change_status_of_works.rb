class ChangeStatusOfWorks < ActiveRecord::Migration[5.2]
  def up
    change_column :works, :status, :integer, default: 0
  end

  def down
    change_column :works, :status, :integer
  end
end
