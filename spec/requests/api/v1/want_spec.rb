require "rails_helper"

RSpec.describe "Api::V1::Wants", type: :request do
  describe "GET /api/v1/want" do
    subject { get(api_v1_want_index_path, headers: headers) }

    before do
      @user = create(:user)
      create_list(:want, 3, user_id: @user.id)
      create_list(:want, 3, user_id: @user.id)
      @wants = @user.wants.order(priority: :asc).map(&:id)
    end

    let(:headers) { @user.create_new_auth_token }
    let(:res) { JSON.parse(response.body) }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "user id is mine" do
      subject
      expect(res.map {|i| i["user"]["id"] }).to eq [@user.id, @user.id, @user.id, @user.id, @user.id, @user.id]
    end

    it "my wants priority is asc" do
      subject
      expect(res.map {|i| i["id"] }).to eq @wants
    end
  end

  describe "GET /api/v1/want/:id" do
    subject { get(api_v1_want_path(want_id), headers: headers) }

    before do
      @user = create(:user)
      @want = create(:want, user_id: @user.id)
    end

    let(:want_id) { @want.id }
    let(:headers) { @user.create_new_auth_token }
    let(:res) { JSON.parse(response.body) }

    it "get http request success" do
      subject
      expect(response).to have_http_status :ok
    end

    it "get my want" do
      subject
      expect(res["user"]["id"]).to eq @user.id
    end

    it "get specified want" do
      subject
      expect(res["id"]).to eq @want.id
    end
  end

  describe "POST /api/v1/want" do
    subject { post(api_v1_want_index_path, headers: headers, params: params) }

    before do
      @user = create(:user)
      create_list(:want, 4, user_id: @user.id)
    end

    let(:headers) { @user.create_new_auth_token }
    let(:params) { { want: attributes_for(:want) } }
    let(:res) { JSON.parse(response.body) }

    it "get http recuest success" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "create want success" do
      expect { subject }.to change { Want.count }.by(1)
    end

    it "priority dose work" do
      subject
      expect(res["priority"]).to eq @user.wants.order(priority: :desc)[0].priority
    end
  end

  describe "PATCH /api/v1/want/:id" do
    subject { patch(api_v1_want_path(want_id), params: params, headers: headers) }

    before { @user = create(:user) }

    let(:want) { create(:want, user_id: @user.id) }
    let(:want_id) { want.id }
    let(:params) { { want: attributes_for(:want, user_id: @user.id) } }
    let(:headers) { @user.create_new_auth_token }
    let(:res) { JSON.parse(response.body) }

    it "get http response success" do
      subject
      expect(response).to have_http_status :ok
    end

    it "change target" do
      subject
      expect(res["name"]).to eq params[:want][:name]
    end

    it "change priority" do
      subject
      expect(res["priority"]).to eq params[:want][:priority]
    end

    it "this is my want" do
      subject
      expect(res["user"]["id"]).to eq @user.id
    end
  end

  describe "DELETE /api/v1/want/:id" do
    subject { delete(api_v1_want_path(want_id), headers: headers) }

    before do
      @user = create(:user)
      @want = create(:want, user_id: @user.id)
      create_list(:want, 3, user_id: @user.id)
    end

    let(:headers) { @user.create_new_auth_token }
    let(:want_id) { @want.id }

    it "get http response success" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "destroyed from db?" do
      expect { subject }.to change { Want.count }.by(-1)
    end
  end
end
