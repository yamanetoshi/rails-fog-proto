require 'spec_helper'

describe "Resavations" do
  before do
    create_logged_in_user
  end

  describe "GET /resavations" do
    it "returns HTTP status 200" do
      get "/resavations"
      response.status.should be(200)
    end
  end

  describe "GET /resavations/1" do
    it "returns HTTP status 200" do
      @resavation = FactoryGirl.create(:resavation)
      get "resavations/1"
      response.status.should be(200)
    end
  end
end
