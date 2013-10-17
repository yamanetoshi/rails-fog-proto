require 'spec_helper'

describe "vmresavation/index.html.erb" do
  before(:each) do
    assign(:resavations, [
      stub_model(Resavation,
        :operation => "Start"
      ),
      stub_model(Resavation,
        :operation => "Start"
      )
    ])
    session[:idx] = "0"
  end

  it "renders a list of resavations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Start".to_s, :count => 2
  end
end
