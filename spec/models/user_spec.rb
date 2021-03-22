require "rails_helper"

RSpec.describe User, type: :model do
  context "normal user creattion" do
    let(:user) { create(:user) }
    it "success" do
      expect(user).to be_valid
    end
  end

  context "abnormal user creation" do
    let(:test1) { FactoryBot.build(:user, email: nil) }
    let(:test2) { FactoryBot.build(:user, password: nil) }
    it "error create user coused by no email" do
      expect(test1).to be_invalid
    end

    it "error create user coused by no password" do
      expect(test2).to be_invalid
    end
  end
end
