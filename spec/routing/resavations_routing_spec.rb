require "spec_helper"

describe ResavationsController do
  describe "routing" do

    it "routes to #index" do
      get("/resavations").should route_to("resavations#index")
    end

    it "routes to #new" do
      get("/resavations/new").should route_to("resavations#new")
    end

    it "routes to #show" do
      get("/resavations/1").should route_to("resavations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/resavations/1/edit").should route_to("resavations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/resavations").should route_to("resavations#create")
    end

    it "routes to #update" do
      put("/resavations/1").should route_to("resavations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/resavations/1").should route_to("resavations#destroy", :id => "1")
    end

  end
end
