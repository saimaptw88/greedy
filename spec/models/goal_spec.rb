require "rails_helper"

RSpec.describe Goal, type: :model do
  context "normal create goal" do
    let(:user) { create(:user) }
    let(:test1) { create(:goal) }

    it "success" do
      expect(test1).to be_valid
    end
  end
end
