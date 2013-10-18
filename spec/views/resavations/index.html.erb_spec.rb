require 'spec_helper'

describe "resavations/index" do
  before(:each) do
    assign(:resavations, [
      stub_model(Resavation,
        :operation => "Operation",
        :hour => "Hour",
        :min => "Min",
        :vmid => 1,
        :conn_id => 2
      ),
      stub_model(Resavation,
        :operation => "Operation",
        :hour => "Hour",
        :min => "Min",
        :vmid => 1,
        :conn_id => 2
      )
    ])
  end

  it "renders a list of resavations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Operation".to_s, :count => 2
    assert_select "tr>td", :text => "Hour".to_s, :count => 2
    assert_select "tr>td", :text => "Min".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
