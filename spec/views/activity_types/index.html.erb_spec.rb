require 'spec_helper'

describe "activity_types/index" do
  before(:each) do
    assign(:activity_types, [
      stub_model(ActivityType,
        :name => "Name",
        :type => "Type"
      ),
      stub_model(ActivityType,
        :name => "Name",
        :type => "Type"
      )
    ])
  end

  it "renders a list of activity_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
