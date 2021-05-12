class PreviewWantSerializer < ActiveModel::Serializer
  attributes :id, :name, :priority, :reachability, :category_id, :why, :deadline, :every_day_task

  belongs_to :user
end
