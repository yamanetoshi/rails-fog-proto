require 'spec_helper'

describe ConnsController do
  describe "Get #index" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in" do
      before do
        login_user
      end

      it "responds successfully with on HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response.code).to eq("200")
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

  describe "Get #new" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in" do
      before do
        login_user
      end

      it "responds successfully with on HTTP 200 status code" do
        get :new
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

  describe "Get #show" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        get :show, {:id => 1}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in" do
      before do
        login_user
      end

      it "responds successfully with on HTTP 200 status code" do
        get :show, {:id => 1 }
        expect(response).to be_success
        expect(response.code).to eq("200")
      end

      it "renders the index template" do
        get :show, {:id => 1}
        expect(response).to render_template("show")
      end

      after do
        sign_out :user
      end
    end
  end

  describe "Get #edit" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        get :edit, {:id => 1}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in" do
      before do
        login_user
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

  describe "Post #create" do
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

      context "with valid params" do
        it "creates a new item" do
          expect {
            post :create, {:conn => {}}}.to change(Conn, :count).by(1)
        end

        it "assigns a newly created item as @item" do
          post :create, {:conn => {}}
          expect(assigns(:conn)).to be_a(Conn)
          expect(assigns(:conn)).to be_persisted
        end

        it "redirects to the created item" do
          post :create, {:conn => {}}
          expect(response).to redirect_to(Conn.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved item as @item" do
          Conn.any_instance.stub(:save).and_return(false)
          post :create, {:conn => {}}
          expect(assigns(:conn)).to be_a_new(Conn)
        end

        it "re-renders the 'new' template" do
          Conn.any_instance.stub(:save).and_return(false)
          post :create, {:conn => {}}
          expect(response).to render_template("new")
        end
      end

      after do
        sign_out :user
      end
    end
  end

  describe "Put #update" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        put :update, {:id => 1, :conn => {}}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in" do
      before do
        login_user
      end

      context "with valid params" do
        it "updates the requested conn" do
          conn = subject.current_user.conns[0]
          Conn.any_instance.should_receive(:update_attributes).with({'access_key' => 'params'})
          put :update, {:id => conn.to_param, :conn => {:access_key => 'params'}}
        end

        it "assigns the requested conn as @conn" do
          conn = subject.current_user.conns[0]
          put :update, {:id => conn.to_param, :conn => {}}
          expect(assigns(:conn)).to eq(conn)
        end

        it "redirects to the item" do
          conn = subject.current_user.conns[0]
          put :update, {:id => conn.to_param, :conn => {}}
          expect(response).to redirect_to(conn)
        end
      end

      context "with invalid params" do
        it "assigns the conn as @conn" do
          conn = subject.current_user.conns[0]
          Conn.any_instance.stub(:save).and_return(false)
          put :update, {:id => conn.to_param, :conn => {}}
          expect(assigns(:conn)).to eq(conn)
        end

        it "re-renders the 'edit' template" do
          conn = subject.current_user.conns[0]
          Conn.any_instance.stub(:save).and_return(false)
          put :update, {:id => conn.to_param, :conn => {}}
          expect(response).to render_template("edit")
        end
      end

      after do
        sign_out :user
      end
    end
  end


  describe "Delete #destroy" do
    context "When user is not signed in" do
      it "should redirect to signin screen" do
        delete :destroy, {:id => 1, :conn => {}}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "When user is signed in" do
      before do
        login_user
      end

      it "destroys the requested item" do
        conn = subject.current_user.conns[0]
        expect {
          delete :destroy, {:id => conn.to_param}
        }.to change(Conn, :count).by(-1)
      end

      it "redirects to the items list" do
        conn = subject.current_user.conns[0]
        delete :destroy, {:id => conn.to_param}
        expect(response).to redirect_to(conns_url)
      end

    end
  end

end
