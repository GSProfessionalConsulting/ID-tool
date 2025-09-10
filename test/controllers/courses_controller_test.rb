require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should redirect index to designer courses" do
    get root_url
    assert_response :success
  end
end
