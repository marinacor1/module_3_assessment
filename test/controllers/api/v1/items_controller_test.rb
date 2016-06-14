require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2,  parsed_json.count
    assert_equal "sock",  parsed_json.last['name']
    assert_equal "its a sock",  parsed_json.last['description']
    assert_equal "http://cdn3.volusion.com/uctgf.ukzte/v/vspfiles/photos/The-Carlton-2.jpg?1431093530", parsed_json.last['image_url']
  end

  test "should get show" do
    get :show, id: 1, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash,  parsed_json.class
    assert_equal "thing",  parsed_json['name']
    assert_equal "its a thing",  parsed_json['description']
    assert_equal "http://static.comicvine.com/uploads/original/11116/111163466/4650999-3128845011-300379.jpeg", parsed_json['image_url']
  end

  test "should delete item" do
    skip
    delete :destroy, id: 1, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash,  parsed_json.class
    assert_equal "thing",  parsed_json['name']
    assert_equal "its a thing",  parsed_json['description']
    assert_equal "http://static.comicvine.com/uploads/original/11116/111163466/4650999-3128845011-300379.jpeg", parsed_json['image_url']
  end

  test "should add item" do
    skip
    post :create, item: ({name: 'blah', description: 'desc', image_url: "llsdjf"}), format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 3,  parsed_json.count
    assert_equal "thing",  parsed_json['name']
    assert_equal "its a thing",  parsed_json['description']
    assert_equal "http://static.comicvine.com/uploads/original/11116/111163466/4650999-3128845011-300379.jpeg", parsed_json['image_url']
  end

end
