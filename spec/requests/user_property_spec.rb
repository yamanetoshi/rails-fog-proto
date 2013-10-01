require 'spec_helper'

describe "UserProperty" do
  describe "user who do not have privilege" do
    before do
      create_logged_in_user
    end

    describe "GET /user_property/index.html" do
      it "returns HTTP status 302" do
        get "/user_property/index.html"
        response.status.should be(302)
      end
    end
  end

  describe "user who have privilege" do
    before do
      create_logged_in_admin_user
      @provider = FactoryGirl.create :provider
    end

    describe "GET /user_property/index.html" do
      it "returns HTTP status 200" do
        get "/providers"
        response.status.should be(200)
      end
    end
  end
end
