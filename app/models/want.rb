class Want < ApplicationRecord
  belongs_to :user

  # def want.malti_update(wants_params)
  #   wants_params.map do |id, want_params|
  #     want = current_user.wants.find(id)
  #     want.update_attributes(want_params)
  #   end
  # end
end
