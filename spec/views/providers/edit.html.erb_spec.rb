require 'spec_helper'

describe "providers/edit" do
  before(:each) do
    @provider = assign(:provider, stub_model(Provider,
      :name => "MyString"
    ))
  end

  it "renders the edit provider form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => providers_path(@provider), :method => "post" do
      assert_select "input#provider_name", :name => "provider[name]"
      assert_select "input#provider_create_vm", :name => "provider[create_vm]"
      assert_select "input#provider_start_vm", :name => "provider[start_vm]"
      assert_select "input#provider_stop_vm", :name => "provider[stop_vm]"
      assert_select "input#provider_reboot_vm", :name => "provider[reboot_vm]"
    end
  end
end
