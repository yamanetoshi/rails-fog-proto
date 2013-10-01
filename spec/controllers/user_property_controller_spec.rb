require 'spec_helper'

describe UserPropertyController do

  describe "GET 'index'" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in but not admin" do
      before do
        login_user
      end

      it "should redirect to root screen" do
        get :index
        expect(response).to redirect_to(root_path)
      end

      after do
        sign_out :user
      end
    end

    context "When user is signed in" do
      before do
        login_admin
      end

      it "responds successfully with on HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response.code).to eq("200")
      end

      it "assigns all providers as @providers" do
        user = User.find(1)
        get :index
        assigns(:users).should eq([user])
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end

      after do
        sign_out :user
      end
    end
  end
end
