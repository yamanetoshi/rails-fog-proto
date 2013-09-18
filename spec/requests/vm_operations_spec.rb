require 'spec_helper'

describe "VmOperations" do
  before do
    create_logged_in_user
  end

  describe "GET /vm_operations" do
    it "returns HTTP status 200" do
      fog_mock_init_request
      get "/vm_operations/0"
      response.status.should be(200)
    end
  end
end
