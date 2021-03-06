class CreateWants < ActiveRecord::Migration[6.0]
  def change
    create_table :wants do |t|
      t.string :name
      t.integer :priority, default: 0
      t.integer :reachability, default: 50
      t.integer :category_id, default: 1
      t.integer :deadline, default: 30
      t.text :why
      t.text :every_day_task
      t.timestamps
    end
  end
end
