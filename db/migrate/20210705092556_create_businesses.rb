class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :title, null: false
      t.integer :status, defalt: 0
  
      t.timestamps
    end
  end
end
