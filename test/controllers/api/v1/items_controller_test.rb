require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 1000,  parsed_json.count
    assert_equal "Name:",  parsed_json
    assert parsed_json.first.include?("Image Url")
    refute parsed_json.first.include?("Created At")
    refute parsed_json.first.include?("Updated At")
  end
end
