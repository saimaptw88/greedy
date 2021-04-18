class CreateWants < ActiveRecord::Migration[6.0]
  def change
    create_table :wants do |t|
      t.string :name
      t.integer :priority, default: 0
      t.integer :reachability, default: 50
      t.integer :category_id, default: 1
      t.timestamps
    end
    add_index :wants, [:priority, :category_id], unique: true
  end
end
