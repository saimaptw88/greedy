class Goal < ApplicationRecord
  belongs_to :user
  has_many :wants, dependent: :destroy
end
