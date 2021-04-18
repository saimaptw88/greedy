class Want < ApplicationRecord
  belongs_to :user
  validates :priority, presence: true, uniqueness: { scope: :category_id }
end
