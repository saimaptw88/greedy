class Api::V1::PreviewWantSerializer < ActiveModel::Serializer
  attributes :id, :name, :priority, :reachability, :category_id

  belongs_to :user
end
