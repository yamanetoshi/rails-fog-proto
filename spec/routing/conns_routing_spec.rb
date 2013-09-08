require 'spec_helper'

describe ConnsController do
  describe "routing" do
    it "routes to #index" do
      get("/conns").should route_to("conns#index")
    end

    it "routes to #new" do
      get("/conns/new").should route_to("conns#new")
    end

    it "routes to #show" do
      get("/conns/1").should route_to("conns#show", :id => "1")
    end

    it "routes to #edit" do
      get("/conns/1/edit").should route_to("conns#edit", :id => "1")
    end

    it "routes to #create" do
      post("/conns").should route_to("conns#create")
    end

    it "routes to #update" do
      put("/conns/1").should route_to("conns#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/conns/1").should route_to("conns#destroy", :id => "1")
    end
  end
end
