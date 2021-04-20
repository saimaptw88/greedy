require "rails_helper"

RSpec.describe Want, type: :model do
  context "normal create want" do
    before do
      @user = create(:user)
    end

    let(:want) { create(:want, user_id: @user.id) }

    it "success" do
      expect(want).to be_valid
    end
  end
end
