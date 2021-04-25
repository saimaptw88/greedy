require "rails_helper"

RSpec.describe "Api::V1::Goals", type: :request do
  describe "GET /api/v1/goal/:id" do
    subject { get(api_v1_goal_path(want_id), headers: headers) }

    before do
      @user = create(:user)
      @want = create(:want, user_id: @user.id, priority: 0, category_id: 1)
      @goal = create(:goal, user_id: @user.id, name: @want.name, id: @want.id)
    end

    let(:want_id) { @want.id }
    let(:headers) { @user.create_new_auth_token }
    let(:res) { JSON.parse(response.body) }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end

    it "goal id is the same as want id" do
      subject
      expect(res["id"]).to eq @want.id
    end

    it "goal name is the same as want name" do
      subject
      expect(res["name"]).to eq @want.name
    end
  end

  describe "POST /api/v1/goal" do
    subject { post(api_v1_goal_index_path, headers: headers, params: params) }

    before do
      @user = create(:user)
      @want = create(:want, user_id: @user.id, priority: 0, category_id: 1)
      @goal = create(:goal, user_id: @user.id, name: @want.name, id: @want.id)
    end

    let(:headers) { @user.create_new_auth_token }
    let(:params) { { goal: attributes_for(:goal) } }
    let(:res) { JSON.parse(response.body) }

    it "return http success" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "goal id is the same as want id" do
      subject
      expect(res["id"]).to eq @want.id
    end

    it "goal name is the same as want name" do
      subject
      expect(res["name"]).to eq @want.name
    end

    it "goal deadline is nil" do
      subject
      expect(res["deadline"]).to eq nil
    end

    it "goal why is nil" do
      subject
      expect(res["why"]).to eq nil
    end
  end

  describe "PATCH  /api/v1/goal/:id" do
    subject { patch(api_v1_goal_path(goal_id), headers: headers, params: params) }

    before do
      @user = create(:user)
      @want = create(:want, user_id: @user.id, priority: 0, category_id: 1)
      @goal = create(:goal, user_id: @user.id, name: @want.name, id: @want.id, category_id: @want.category_id, priority: @want.priority, why: nil, reachability: nil)
    end

    let(:goal_id) { @goal.id }
    let(:headers) { @user.create_new_auth_token }
    let(:params) { { goal: attributes_for(:goal) } }
    let(:res) { JSON.parse(response.body) }

    it "return http saccess" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "id is not change" do
      subject
      expect(res["id"]).to eq @want.id
    end

    it "priority is not change" do
      subject
      expect(res["priority"]).to eq @want.priority
    end

    it "category_id is not change" do
      subject
      expect(res["category_id"]).to eq @want.category_id
    end

    it "dealine change success" do
      subject
      expect(res["deadline"]).to eq params[:goal][:deadline]
    end

    it "why change success" do
      subject
      expect(res["why"]).to eq params[:goal][:why]
    end
  end
end
