class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.integer :priority
      t.integer :reachability
      t.integer :category_id
      t.integer :deadline
      t.text :why
      t.text :every_day_task

      t.timestamps
    end
  end
end
