require "spec_helper"

describe UserPropertyController do
  describe "routing" do

    it "routes to #index" do
      get("/user_property/index.html").should route_to("user_property#index", :format => "html")
    end
  end
end
