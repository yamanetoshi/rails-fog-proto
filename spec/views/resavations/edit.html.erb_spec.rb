require 'spec_helper'

describe "resavations/edit" do
  before(:each) do
    @resavation = assign(:resavation, stub_model(Resavation,
      :operation => "MyString",
      :hour => "MyString",
      :min => "MyString",
      :vmid => 1,
      :conn_id => 1
    ))
  end

  it "renders the edit resavation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => resavations_path(@resavation), :method => "post" do
      assert_select "input#resavation_operation", :name => "resavation[operation]"
      assert_select "input#resavation_hour", :name => "resavation[hour]"
      assert_select "input#resavation_min", :name => "resavation[min]"
      assert_select "input#resavation_vmid", :name => "resavation[vmid]"
      assert_select "input#resavation_conn_id", :name => "resavation[conn_id]"
    end
  end
end
