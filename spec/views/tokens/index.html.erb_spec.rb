require 'spec_helper'

describe "tokens/index" do
  before(:each) do
    assign(:tokens, [
      stub_model(Token,
        :token => "Token"
      ),
      stub_model(Token,
        :token => "Token"
      )
    ])
  end

  it "renders a list of tokens" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Token".to_s, :count => 2
  end
end
