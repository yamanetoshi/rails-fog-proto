require 'spec_helper'
require 'fog'

describe VirtualMachine do

  before do
    @conn = FactoryGirl.create(:conn)

    Fog.mock!
    Fog::Mock.delay = 0
    mock_creds = { :provider => @conn.provider.name,
      :cloudstack_api_key => "xxx",
      :cloudstack_secret_access_key => "yyy",
      :cloudstack_host => "hostname",
      :cloudstack_port => "port",
      :cloudstack_path => "uri",
      :cloudstack_scheme => "scheme",
    }
    cloudstack = Fog::Compute.new(mock_creds)
    Fog::Compute.stub(:new).and_return(cloudstack)
    cloudstack.stub(:list_virtual_machines).and_return({})
  end

  describe "self.find_by_conn" do
    before do 
      @ret = VirtualMachine.find_by_conn(@conn)
    end

    it "returns conn" do
      expect(@ret[:conn][:access_key]).to eq("xxx")
      expect(@ret[:conn][:end_point]).to eq("http://dummy.example.com/")
      expect(@ret[:conn][:secret_access_key]).to eq("yyy")
      expect(@ret[:conn][:provider_id]).to eq(1)
      expect(@ret[:conn][:user_id]).to eq(1)
    end

    it "returns Hash from Fog" do
      expect(@ret[:vms]).to eq({})
    end
  end
end
