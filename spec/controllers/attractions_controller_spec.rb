require 'rails_helper'

RSpec.describe AttractionsController, type: :controller do
  describe "GET index" do
    context "when user is authenticated" do
      before do
        login_user
      end

      it "assigns @attraction" do
        get :index
        expect(assigns(:attraction)).to be_a_new(Attraction)
      end
    end

    context "when user is not authenticated" do
      it "redirects to login page" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      before do
        login_user
        post :create, { attraction: { name: "Example" }}
      end

      it "saves the new attraction" do
        expect(assigns(:attraction)).to be_a(Attraction)
        expect(assigns(:attraction)).to be_persisted
      end

      it "redirects to attractions#index" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid attributes" do
      before do
        login_user
        post :create, { attraction: { name: nil }}
      end

      it "does not save the new attraction" do
        expect(assigns(:attraction)).to be_a(Attraction)
        expect(assigns(:attraction)).not_to be_persisted
      end

      it "redirects to attractions#index" do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end