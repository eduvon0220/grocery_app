require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  test "should get route to show item" do
    assert_routing '/lists/3/items/7', {controller: "items", action: "show",
    	list_id: "3", id: "7" }
  end

  test "should route to items index" do
    assert_routing '/lists/3/items', {controller: "items",
    	action: "index", list_id: "3"}
  end

end
