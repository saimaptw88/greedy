class PreviewWantSerializer < ActiveModel::Serializer
  attributes :id, :target, :priority, :reachability

  belongs_to :user
end
