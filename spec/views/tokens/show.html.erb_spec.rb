require 'spec_helper'

describe "tokens/show" do
  before(:each) do
    @token = assign(:token, stub_model(Token,
      :token => "Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Token/)
  end
end
