require "test_helper"

class PicturesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    sign_in users(:elon)
    get root_url
    assert_response :success
  end
end
