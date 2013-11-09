require 'spec_helper'

describe "activity_types/show" do
  before(:each) do
    @activity_type = assign(:activity_type, stub_model(ActivityType,
      :name => "Name",
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Type/)
  end
end
