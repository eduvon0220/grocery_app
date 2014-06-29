require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should show a list" do
  	assert_routing '/lists/3', { controller: "lists",
  		action: "show", id: "3" }
  end

end
