require 'spec_helper'

describe "resavations/show" do
  before(:each) do
    @resavation = assign(:resavation, stub_model(Resavation,
      :operation => "Operation",
      :hour => "Hour",
      :min => "Min",
      :vmid => 1,
      :conn_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Operation/)
    rendered.should match(/Hour/)
    rendered.should match(/Min/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
