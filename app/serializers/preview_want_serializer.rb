class PreviewWantSerializer < ActiveModel::Serializer
  attributes :id, :name, :priority, :reachability, :category_id

  belongs_to :user
end
