class AddGoalIdToWant < ActiveRecord::Migration[6.0]
  def change
    add_reference :wants, :goal, foreign_key: true
  end
end
