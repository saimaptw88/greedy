class Api::V1::GoalSerializer < ActiveModel::Serializer
  attributes :id, :name, :priority, :category_id, :why, :deadline, :every_day_task

  belongs_to :user
end
