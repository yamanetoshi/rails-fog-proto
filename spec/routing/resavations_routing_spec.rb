require "spec_helper"

describe ResavationsController do
  describe "routing" do

    it "routes to #index" do
      get("/resavations").should route_to("resavations#index")
    end

    it "routes to #show" do
      get("/resavations/1").should route_to("resavations#show", :id => "1")
    end

  end
end
