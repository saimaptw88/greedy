class AddUserIdToWant < ActiveRecord::Migration[6.0]
  def change
    add_reference :wants, :user, foreign_key: true
  end
end
