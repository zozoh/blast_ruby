require 'spec_helper'

describe "blasts/show" do
  before(:each) do
    @blast = assign(:blast, stub_model(Blast,
      :content => "Content",
      :picture => "Picture"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
    rendered.should match(/Picture/)
  end
end
