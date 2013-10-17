require 'spec_helper'

describe VmresavationController do

  describe "GET 'index'" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        get :index, { :id => "0" }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in" do
      before do
        login_user
      end

      it "returns http success" do
        fog_mock_init

        get 'index', { :id => "0" }
        expect(response).to be_success
        expect(response.code).to eq("200")
      end

      it "renders the index template" do
        fog_mock_init
        get :index, { :id => "0" }
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
        get 'index', { :id => "0" }

        post 'create'
        expect(response).to redirect_to(:action => 'index', :id => '0')
      end

      after do
        sign_out :user
      end
    end
  end

  describe "GET 'edit'" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        get :edit, {:id => 1}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in" do
      before do
        login_user
        @resavation = FactoryGirl.create(:resavation)
      end

      it "responds successfully with on HTTP 200 status code" do
        get :edit, {:id => 1 }
        expect(response).to be_success
        expect(response.code).to eq("200")
      end

      it "renders the index template" do
        get :edit, {:id => 1}
        expect(response).to render_template("edit")
      end

      after do
        sign_out :user
      end
    end
  end

  describe "GET 'update'" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        put :update, {:id => 1, :resavation => {}}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in" do
      before do
        login_user
        @resavation = FactoryGirl.create(:resavation)
      end

      context "with valid params" do
        it "updates the requested conn" do
          Resavation.any_instance.should_receive(:update_attributes).with({'operation' => 'Start'})
          put :update, {:id => 1, :resavation => {:operation => 'Start'}}
        end

        it "assigns the requested conn as @conn" do
          get 'index', { :id => "0" }

          put :update, {:id => 1, :resavation => {}}
          expect(assigns(:resavation)).to eq(@resavation)
        end

        it "redirects to the item" do
          get 'index', { :id => "0" }

          put :update, {:id => 1, :conn => {}}
          expect(response).to redirect_to(:action => 'index', :id => '0')
        end
      end

      context "with invalid params" do
        it "assigns the conn as @conn" do
          Resavation.any_instance.stub(:save).and_return(false)
          put :update, {:id => 1, :conn => {}}
          expect(assigns(:resavation)).to eq(@resavation)
        end

        it "re-renders the 'edit' template" do
          Resavation.any_instance.stub(:save).and_return(false)
          put :update, {:id => 1, :conn => {}}
          expect(response).to render_template("edit")
        end
      end

      after do
        sign_out :user
      end
    end
  end

  describe "GET 'destroy'" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        delete :destroy, {:id => 1, :resavation => {}}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in" do
      before do
        login_user
        @resavation = FactoryGirl.create(:resavation)
      end

      it "destroys the requested item" do
        get 'index', { :id => "0" }

        expect {
          delete :destroy, {:id => 1 }
        }.to change(Resavation, :count).by(-1)
      end

      it "redirects to the items list" do
        get 'index', { :id => "0" }

        delete :destroy, {:id => 1}
        expect(response).to redirect_to(:action => 'index', :id => '0')
      end

    end
  end

end
