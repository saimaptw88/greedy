class CreateWants < ActiveRecord::Migration[6.0]
  def change
    create_table :wants do |t|
      t.string :name
      t.integer :priority
      t.integer :reachability, default: 50
      t.integer :category_id, default: 1
      t.timestamps
    end
  end
end
