require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get properties_new_url
    assert_response :success
  end

  test "should get edit" do
    get properties_edit_url
    assert_response :success
  end

  test "should get delete" do
    get properties_delete_url
    assert_response :success
  end

end
