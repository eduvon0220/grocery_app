require 'spec_helper'

describe "servers/edit" do
  before(:each) do
    @server = assign(:server, stub_model(Server,
      :name => "MyString",
      :ip_address => "MyString"
    ))
  end

  it "renders the edit server form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", server_path(@server), "post" do
      assert_select "input#server_name[name=?]", "server[name]"
      assert_select "input#server_ip_address[name=?]", "server[ip_address]"
    end
  end
end
