require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2,  parsed_json.count
    assert_equal "sock",  parsed_json.first['name']
    assert_equal "its a sock",  parsed_json.first['description']
    assert_equal "http://cdn3.volusion.com/uctgf.ukzte/v/vspfiles/photos/The-Carlton-2.jpg?1431093530", parsed_json.first['image_url']
  end
end
