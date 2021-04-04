require "rails_helper"

RSpec.describe "Auth::Registrations", type: :request do
  describe "POST /auth" do
    subject { post(user_registration_path, params: params) }

    context "normal" do
      let(:params) { attributes_for(:user) }

      it "success sign up" do
        subject
        expect(response).to have_http_status(:ok)
      end

      it "success increase user in db" do
        expect { subject }.to change { User.count }.by(1)
      end
    end

    context "abnormal" do
      let(:res) { JSON.parse(response.body) }
      context "no email" do
        let(:params) { attributes_for(:user, email: nil) }
        it "error becouse of no email" do
          subject
          expect(res["errors"]["full_messages"]).to eq ["Email can't be blank"]
        end
      end

      context "no password" do
        let(:params) { attributes_for(:user, password: nil) }
        it "error becouse of no password" do
          subject
          expect(res["errors"]["full_messages"]).to eq ["Password can't be blank", "Password confirmation doesn't match Password"]
        end
      end

      context "password_confirmation is not match to password" do
        let(:params) { attributes_for(:user, password_confirmation: "123456789") }
        it "error caused by miss password_confirmation" do
          subject
          expect(res["errors"]["full_messages"]).to eq ["Password confirmation doesn't match Password"]
        end
      end
    end
  end
end
