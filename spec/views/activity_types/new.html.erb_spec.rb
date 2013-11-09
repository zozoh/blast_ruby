require 'spec_helper'

describe "activity_types/new" do
  before(:each) do
    assign(:activity_type, stub_model(ActivityType,
      :name => "MyString",
      :type => ""
    ).as_new_record)
  end

  it "renders new activity_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", activity_types_path, "post" do
      assert_select "input#activity_type_name[name=?]", "activity_type[name]"
      assert_select "input#activity_type_type[name=?]", "activity_type[type]"
    end
  end
end
