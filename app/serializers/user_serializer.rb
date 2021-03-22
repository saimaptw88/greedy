class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password

  has_many :PreviewWantSerializer
end
