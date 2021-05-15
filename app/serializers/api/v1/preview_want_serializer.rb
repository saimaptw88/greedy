class Api::V1::PreviewWantSerializer < ActiveModel::Serializer
  attributes :id, :name, :priority, :reachability, :category_id, :why, :every_day_task

  belongs_to :user
end
