class CreateWants < ActiveRecord::Migration[6.0]
  def change
    create_table :wants do |t|
      t.string :target
      t.integer :priority
      t.integer :reachability

      t.timestamps
    end
  end
end
