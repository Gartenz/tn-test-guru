require 'test_helper'

class GistsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get gists_show_url
    assert_response :success
  end

end
