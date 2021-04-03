require "rails_helper"

RSpec.describe "Registrations", type: :request do
  describe "POST /auth" do
    context "normal" do
      subject { post(user_registration_path, params: params) }

      let(:params) { attributes_for(:user) }

      it "success sign up" do
        subject
        expect(response).to have_http_status(:ok)
      end

      it "success increase user in db" do
        expect { subject }.to change { User.count }.by(1)
      end
    end
  end
end
