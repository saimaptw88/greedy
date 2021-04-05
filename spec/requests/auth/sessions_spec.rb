require "rails_helper"

RSpec.describe "Sessions", type: :request do
  describe "POST /auth/sign_in" do
    subject { post(user_session_path, params: params, headers: headers) }

    before { @user = create(:user) }

    let(:headers) { @user.create_new_auth_token }

    context "normal" do
      let(:params) { { email: @user.email, password: @user.password } }
      it "success to login" do
        subject
        expect(response).to have_http_status :ok
      end
    end

    context "abnormal" do
      let(:params) { { email: "", password: @user.password } }
      let(:res) { JSON.parse(response.body) }

      it "error to sign in" do
        subject
        expect(res["errors"]).to eq ["Invalid login credentials. Please try again."]
      end
    end
  end

  describe "DELETE /auth/sign_out" do
    subject { delete(destroy_user_session_path, headers: headers) }

    before { @user = create(:user) }

    let(:headers) { @user.create_new_auth_token }
    let(:params) { { email: @user.email, password: @user.password, password_confirmation: @user.password_confirmation } }

    it "success to logout" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "user token deleted" do
      subject
      expect(@user.reload.tokens).to be_blank
    end
  end
end
