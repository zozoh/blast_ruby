require 'spec_helper'

describe "tokens/new" do
  before(:each) do
    assign(:token, stub_model(Token,
      :token => "MyString"
    ).as_new_record)
  end

  it "renders new token form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tokens_path, "post" do
      assert_select "input#token_token[name=?]", "token[token]"
    end
  end
end
