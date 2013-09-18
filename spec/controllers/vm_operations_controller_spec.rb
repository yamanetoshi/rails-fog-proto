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
      end
    end
  end

  describe "GET 'new'" do
    before do
      login_user
    end

    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    before do
      login_user
    end

    it "returns http success" do
      fog_mock_init

      post 'create'
#      response.should be_success
        expect(response).to redirect_to(:action => 'index', :idx => '0')
#      expect(response).to render_template("vm_operations/index")
    end
  end

  describe "GET 'start'" do
    before do
      login_user
    end

    it "returns http success" do
      get 'start', {:id => 1}
      response.should be_success
    end
  end

  describe "GET 'stop'" do
    before do
      login_user
    end

    it "returns http success" do
      get 'stop', {:id => 1}
      response.should be_success
    end
  end

end
