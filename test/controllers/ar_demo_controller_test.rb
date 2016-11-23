require 'test_helper'

class ArDemoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ar_demo_index_url
    assert_response :success
  end

end
