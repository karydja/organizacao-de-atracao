require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET index" do
    context "when user is authenticated" do
      before do
        login_user

        5.times do
          create(:user)
        end
      end

      it "assigns @users" do
        get :index
        expect(assigns(:users).count).to eq(6)
      end
    end

    context "when user is not authenticated" do
      it "redirects to login page" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end