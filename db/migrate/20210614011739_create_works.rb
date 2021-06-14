class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.datetime :start_time, null: false
      t.integer :status, defalt: 0
      t.text :remarks

      t.timestamps
    end
  end
end




    
