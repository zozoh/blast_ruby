require 'spec_helper'

describe "blasts/new" do
  before(:each) do
    assign(:blast, stub_model(Blast,
      :content => "MyString",
      :picture => "MyString"
    ).as_new_record)
  end

  it "renders new blast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blasts_path, "post" do
      assert_select "input#blast_content[name=?]", "blast[content]"
      assert_select "input#blast_picture[name=?]", "blast[picture]"
    end
  end
end
