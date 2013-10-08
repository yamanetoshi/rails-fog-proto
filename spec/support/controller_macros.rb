module ControllerMacros
  def login_admin
#    @request.env["devise.mapping"] = Devise.mappings[:admin]
#    sign_in FactoryGirl.create(:adminuser)
    controller.stub(:authenticate_user!).and_return true
    controller.stub(:admin_login).and_return true
    @request.env["devise.mapping"] = Devise.mappings[:adminuser]
    user = FactoryGirl.create(:adminuser)
    user.confirm!
    sign_in user
  end

  def login_user
    controller.stub(:authenticate_user!).and_return true
    @request.env["devise.mapping"] = Devise.mappings[:user]
    conn = FactoryGirl.create(:conn)
    user = User.find(conn.user_id)
    user.confirm!
    sign_in user
    controller.stub!(:current_user).and_return(user)
  end

  def fog_mock_init_request
    Fog.mock!
    Fog::Mock.delay = 0
    @mock_creds = { :provider => "CloudStack",
      :cloudstack_api_key => "xxx",
      :cloudstack_secret_access_key => "yyy",
      :cloudstack_host => "hostname",
      :cloudstack_port => "port",
      :cloudstack_path => "uri",
      :cloudstack_scheme => "scheme",
    }
    cloudstack = Fog::Compute.new(@mock_creds)
    Fog::Compute.stub(:new).and_return(cloudstack)
    cloudstack.stub(:deploy_virtual_machine).and_return(nil)
    cloudstack.stub(:start_virtual_machine).and_return(nil)
    cloudstack.stub(:stop_virtual_machine).and_return(nil)
    cloudstack
  end

  def fog_mock_init
    cloudstack = fog_mock_init_request
    session[:idx] = "0"
    cloudstack.stub(:list_virtual_machines).and_return({"listvirtualmachinesresponse" => {"virtualmachine" => [{"id" => 1}]}})
  end
end
