require 'spec_helper'

describe VmOperationsController do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/vm_operations/1").to route_to(:controller => "vm_operations",
                                                     :action => "index",
                                                     :idx => "1")
    end

    it "routes to #new" do
      expect(:get => "/vm_operations/new").to route_to(:controller => "vm_operations",
                                                       :action => "new")
    end

    it "routes to #create" do
      expect(:post => "/vm_operations").to route_to(:controller => "vm_operations",
                                                    :action => "create")
    end

    it "routes to #start" do
      expect(:get => "/vm_operations/1/start").to route_to(:controller => "vm_operations",
                                                            :action => 'start',
                                                            :id => '1')
    end

    it "routes to #stop" do
      expect(:get => "/vm_operations/1/stop").to route_to(:controller => "vm_operations",
                                                            :action => 'stop',
                                                            :id => '1')
    end
  end
end
