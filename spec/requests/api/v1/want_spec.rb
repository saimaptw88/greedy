require "rails_helper"

RSpec.describe "Api::V1::Wants", type: :request do
  describe "GET /api/v1/want" do
    subject { get(api_v1_want_index_path, headers: headers) }

    before do
      @user = create(:user)
      want1 = create(:want, user_id: @user.id, priority: 1)
      want2 = create(:want, user_id: @user.id, priority: 2)
      want3 = create(:want, user_id: @user.id, priority: 3)
      @wants = [want1, want2, want3].map {|i| i["id"] }
    end

    let(:headers) { @user.create_new_auth_token }
    let(:res) { JSON.parse(response.body) }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "user id is mine" do
      subject
      expect(res.map {|i| i["user"]["id"] }).to eq [@user.id, @user.id, @user.id]
    end

    it "my wants priority is asc" do
      subject
      expect(res.map {|i| i["id"] }).to eq @wants
    end
  end
end
