require 'spec_helper'

describe "Providers" do
  describe "user who do not have privilege" do
    before do
      create_logged_in_user
    end

    describe "GET /providers" do
      it "returns HTTP status 302" do
        get "/providers"
        response.status.should be(302)
      end
    end

    describe "GET /providers/new" do
      it "returns HTTP status 302" do
        get "/providers/new"
        response.status.should be(302)
      end
    end

    describe "GET /providers/0/edit" do
      it "returns HTTP status 302" do
        get "/providers/0/edit"
        response.status.should be(302)
      end
    end

    describe "GET /providers/0" do
      it "returns HTTP status 302" do
        get "providers/0"
        response.status.should be(302)
      end
    end
  end

  describe "user who have privilege" do
    before do
      create_logged_in_admin_user
      @provider = FactoryGirl.create :provider
    end

    describe "GET /providers" do
      it "returns HTTP status 200" do
        get "/providers"
        response.status.should be(200)
      end
    end

    describe "GET /providers/new" do
      it "returns HTTP status 200" do
        get "/providers/new"
        response.status.should be(200)
      end
    end

    describe "GET /providers/1/edit" do
      it "returns HTTP status 200" do
        get "/providers/1/edit"
        response.status.should be(200)
      end
    end

    describe "GET /providers/1" do
      it "returns HTTP status 200" do
        get "providers/1"
        response.status.should be(200)
      end
    end
  end
end
