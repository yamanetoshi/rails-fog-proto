require 'spec_helper'

describe "VmOperations" do
  before do
    create_logged_in_user
  end

  describe "GET /vm_operations/0" do
    it "returns HTTP status 200" do
      fog_mock_init_request
      get "/vm_operations/0"
      response.status.should be(200)
    end
  end

  describe "GET /vm_operations/new" do
    it "returns HTTP status 200" do
      fog_mock_init_request
      get "/vm_operations/new"
      response.status.should be(200)
    end
  end

  describe "POST /vm_operations" do
    it "returns HTTP status 302" do
      fog_mock_init_request
      get "/vm_operations/0"
      post "/vm_operations"
      response.status.should be(302)
    end
  end

  describe "GET /vm_operations/:id/start" do
    it "returns HTTP status 302" do
      fog_mock_init_request
      get "/vm_operations/0"
      get "/vm_operations/1/start"
      response.status.should be(302)
    end
  end

  describe "GET /vm_operations/:id/stop" do
    it "returns HTTP status 302" do
      fog_mock_init_request
      get "/vm_operations/0"
      get "/vm_operations/1/stop"
      response.status.should be(302)
    end
  end
end
