class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :title, null: false
      t.integer :status, defalt: 0, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
