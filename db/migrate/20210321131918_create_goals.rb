class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.integer :deadline
      t.text :why

      t.timestamps
    end
  end
end
