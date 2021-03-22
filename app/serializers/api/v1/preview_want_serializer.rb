class Api::V1::PreviewWantSerializer < ActiveModel::Serializer
  attributes :id, :target, :priority, :reachability

  belongs_to :user
end
