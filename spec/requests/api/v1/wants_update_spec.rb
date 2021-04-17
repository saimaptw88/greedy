require "rails_helper"

RSpec.describe "Api::V1::WantsUpdates", type: :request do
  describe "PATCH /api/v1/updates" do
    subject { patch(api_v1_updates_path, params: params, headers: headers) }

    before do
      @user = create(:user)
      # factorybotでキャッシュさせないため
      want1 = create(:want, user_id: @user.id, id: 0)
      want2 = create(:want, user_id: @user.id, id: 1)
      want3 = create(:want, user_id: @user.id, id: 2)
      want4 = create(:want, user_id: @user.id, id: 3)
      @iwants = [want1, want2, want3, want4]
      # 更新するためのパラメータ配列
      @wants = []
      # id以外を更新,priorityは降順に変更
      (0..3).each do |i|
        @wants.push(attributes_for(:want, user_id: @user.id, id: i, priority: 3 - i))
      end
    end

    let(:params) { { wants: @wants } }
    let(:headers) { @user.create_new_auth_token }
    let(:res) { JSON.parse(response.body) }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "priority sort order asc is success" do
      subject
      expect(res.map {|i| i["priority"] }).to eq @iwants.map(&:id)
    end

    it "id is not change and id sort is changed" do
      subject
      expect(res.map {|i| i["id"] }).to eq [3, 2, 1, 0]
    end
  end
end
