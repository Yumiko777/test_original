class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.datetime :start_time, null: false
      t.integer :status, defalt: 0, null: false
      t.text :remarks
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
