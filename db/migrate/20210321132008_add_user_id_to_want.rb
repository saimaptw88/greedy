class AddUserIdToWant < ActiveRecord::Migration[6.0]
  def change
    add_reference :wants, :user, foreign_key: true
    user = User.first
    user.wants.create!(target: "done own website and original app", priority: 3, reachability: 40)
    user.wants.create!(target: "get job at system engineer", priority: 2, reachability: 50)
    user.wants.create!(target: "finish studying web app engineering", priority: 1, reachability: 90)
  end
end
