require "rails_helper"

RSpec.describe Want, type: :model do
  context "normal create want" do
    let(:user) { create(:user) }
    let(:goal) { create(:goal, user_id: user.id) }
    let(:want) { create(:want) }

    it "success" do
      expect(want).to be_valid
    end
  end
end
