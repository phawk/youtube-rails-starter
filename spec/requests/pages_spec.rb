require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /" do
    context "when signed in" do
      let(:user) { users(:test) }
      before { sign_in(user) }

      it "returns http success" do
        get "/"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Test")
      end
    end

    context "when signed out" do
      it "redirects to sign in" do
        get "/"
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
