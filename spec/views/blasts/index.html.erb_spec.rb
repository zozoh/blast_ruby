require 'spec_helper'

describe "blasts/index" do
  before(:each) do
    assign(:blasts, [
      stub_model(Blast,
        :content => "Content",
        :picture => "Picture"
      ),
      stub_model(Blast,
        :content => "Content",
        :picture => "Picture"
      )
    ])
  end

  it "renders a list of blasts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
  end
end
