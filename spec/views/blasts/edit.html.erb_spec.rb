require 'spec_helper'

describe "blasts/edit" do
  before(:each) do
    @blast = assign(:blast, stub_model(Blast,
      :content => "MyString",
      :picture => "MyString"
    ))
  end

  it "renders the edit blast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blast_path(@blast), "post" do
      assert_select "input#blast_content[name=?]", "blast[content]"
      assert_select "input#blast_picture[name=?]", "blast[picture]"
    end
  end
end
