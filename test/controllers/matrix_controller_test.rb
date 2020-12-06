require 'test_helper'

class MatrixControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get matrix_show_url
    assert_response :success
  end

end
