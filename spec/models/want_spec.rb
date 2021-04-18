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

  context "abnormal create want" do
    before do
      @user = create(:user)
      @want = create(:want, user_id: @user.id)
    end

    let(:error1) { build(:want, priority: nil) }
    let(:error2) { build(:want, category_id: @want.category_id, priority: @want.priority) }

    it "error with no :priority" do
      expect(error1).to be_invalid
    end

    it "error with duplicate priority in one category" do
      expect(error2).to be_invalid
    end
  end
end
