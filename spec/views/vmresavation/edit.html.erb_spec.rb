require 'spec_helper'

describe "vmresavation/edit.html.erb" do
  before(:each) do
    @resavation = assign(:resavation, stub_model(Resavation,
      :operation => "Start"
    ))
    session[:vmid] = "0"
  end

  it "renders the edit provider form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vmresavation_index_path(@resavation), :method => "post" do
      assert_select "select#resavation_operation", :name => "resavation[operation]"
      assert_select "select#resavation_hour", :name => "resavation[hour]"
      assert_select "select#resavation_min", :name => "resavation[min]"
    end
  end
end
