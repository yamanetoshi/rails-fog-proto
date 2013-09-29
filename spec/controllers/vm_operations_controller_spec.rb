require 'spec_helper'

describe VmOperationsController do

  describe "GET 'index'" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        get :index, { :idx => "0" }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in" do
      before do
        login_user
      end

      it "returns http success" do
        fog_mock_init

        get 'index', { :idx => "0" }
        expect(response).to be_success
        expect(response.code).to eq("200")
      end

      it "renders the index template" do
        fog_mock_init
        get :index, { :idx => "0" }
        expect(response).to render_template("index")
      end

      after do
        sign_out :user
      end
    end
  end

  describe "GET 'new'" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user is signed in" do
      before do
        login_user
      end

      it "returns http success" do
        get 'new'
        expect(response).to be_success
        expect(response.code).to eq("200")
      end

      it "renders the index template" do
        get :new
        expect(response).to render_template("new")
      end

      after do
        sign_out :user
      end
    end
  end

  describe "POST 'create'" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in" do
      before do
        login_user
      end

      it "returns http success" do
        fog_mock_init

        post 'create'
        expect(response).to redirect_to(:action => 'index', :idx => '0')
      end

      after do
        sign_out :user
      end
    end
  end

  describe "GET 'start'" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in" do
      before do
        login_user
      end

      it "returns http success" do
        fog_mock_init

        get 'start', {:id => 1}
        expect(response).to redirect_to(:action => 'index', :idx => '0')
      end
    end
  end

  describe "GET 'stop'" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in" do
      before do
        login_user
      end

      it "returns http success" do
        fog_mock_init

        get 'stop', {:id => 1}
        expect(response).to redirect_to(:action => 'index', :idx => '0')
      end
    end
  end

end
