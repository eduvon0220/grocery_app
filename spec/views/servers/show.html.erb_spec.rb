require 'spec_helper'

describe "servers/show" do
  before(:each) do
    @server = assign(:server, stub_model(Server,
      :name => "Name",
      :ip_address => "Ip Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Ip Address/)
  end
end
