require 'test_helper'

class DaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dare = dares(:one)
  end

  test "should get index" do
    get dares_url
    assert_response :success
  end

  test "should get new" do
    get new_dare_url
    assert_response :success
  end

  test "should create dares" do
    assert_difference('Dare.count') do
      post dares_url, params: {dares: {category_id: @dare.category_id, description: @dare.description, title: @dare.title, user_id: @dare.user_id } }
    end

    assert_redirected_to dare_url(Dare.last)
  end

  test "should show dares" do
    get dare_url(@dare)
    assert_response :success
  end

  test "should get edit" do
    get edit_dare_url(@dare)
    assert_response :success
  end

  test "should update dares" do
    patch dare_url(@dare), params: {dares: {category_id: @dare.category_id, description: @dare.description, title: @dare.title, user_id: @dare.user_id } }
    assert_redirected_to dare_url(@dare)
  end

  test "should destroy dares" do
    assert_difference('Dare.count', -1) do
      delete dare_url(@dare)
    end

    assert_redirected_to dares_url
  end
end
