require 'spec_helper'

describe "providers/show" do
  before(:each) do
    @provider = assign(:provider, stub_model(Provider,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Create vm/)
    rendered.should match(/Start vm/)
    rendered.should match(/Stop vm/)
    rendered.should match(/Reboot vm/)
    rendered.should match(/List vm/)
  end
end
