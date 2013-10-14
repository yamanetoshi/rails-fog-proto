require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ResavationsController do

  # This should return the minimal set of attributes required to create a valid
  # Resavation. As you add validations to Resavation, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ResavationsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all resavations as @resavations" do
      resavation = Resavation.create! valid_attributes
      get :index, {}, valid_session
      assigns(:resavations).should eq([resavation])
    end
  end

  describe "GET show" do
    it "assigns the requested resavation as @resavation" do
      resavation = Resavation.create! valid_attributes
      get :show, {:id => resavation.to_param}, valid_session
      assigns(:resavation).should eq(resavation)
    end
  end

  describe "GET new" do
    it "assigns a new resavation as @resavation" do
      get :new, {}, valid_session
      assigns(:resavation).should be_a_new(Resavation)
    end
  end

  describe "GET edit" do
    it "assigns the requested resavation as @resavation" do
      resavation = Resavation.create! valid_attributes
      get :edit, {:id => resavation.to_param}, valid_session
      assigns(:resavation).should eq(resavation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Resavation" do
        expect {
          post :create, {:resavation => valid_attributes}, valid_session
        }.to change(Resavation, :count).by(1)
      end

      it "assigns a newly created resavation as @resavation" do
        post :create, {:resavation => valid_attributes}, valid_session
        assigns(:resavation).should be_a(Resavation)
        assigns(:resavation).should be_persisted
      end

      it "redirects to the created resavation" do
        post :create, {:resavation => valid_attributes}, valid_session
        response.should redirect_to(Resavation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved resavation as @resavation" do
        # Trigger the behavior that occurs when invalid params are submitted
        Resavation.any_instance.stub(:save).and_return(false)
        post :create, {:resavation => {}}, valid_session
        assigns(:resavation).should be_a_new(Resavation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Resavation.any_instance.stub(:save).and_return(false)
        post :create, {:resavation => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested resavation" do
        resavation = Resavation.create! valid_attributes
        # Assuming there are no other resavations in the database, this
        # specifies that the Resavation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Resavation.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => resavation.to_param, :resavation => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested resavation as @resavation" do
        resavation = Resavation.create! valid_attributes
        put :update, {:id => resavation.to_param, :resavation => valid_attributes}, valid_session
        assigns(:resavation).should eq(resavation)
      end

      it "redirects to the resavation" do
        resavation = Resavation.create! valid_attributes
        put :update, {:id => resavation.to_param, :resavation => valid_attributes}, valid_session
        response.should redirect_to(resavation)
      end
    end

    describe "with invalid params" do
      it "assigns the resavation as @resavation" do
        resavation = Resavation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Resavation.any_instance.stub(:save).and_return(false)
        put :update, {:id => resavation.to_param, :resavation => {}}, valid_session
        assigns(:resavation).should eq(resavation)
      end

      it "re-renders the 'edit' template" do
        resavation = Resavation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Resavation.any_instance.stub(:save).and_return(false)
        put :update, {:id => resavation.to_param, :resavation => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested resavation" do
      resavation = Resavation.create! valid_attributes
      expect {
        delete :destroy, {:id => resavation.to_param}, valid_session
      }.to change(Resavation, :count).by(-1)
    end

    it "redirects to the resavations list" do
      resavation = Resavation.create! valid_attributes
      delete :destroy, {:id => resavation.to_param}, valid_session
      response.should redirect_to(resavations_url)
    end
  end

end
