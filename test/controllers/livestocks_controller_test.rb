require 'test_helper'

class LivestocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @livestock = livestocks(:one)
  end

  test "should get index" do
    get livestocks_url
    assert_response :success
  end

  test "should get new" do
    get new_livestock_url
    assert_response :success
  end

  test "should create livestock" do
    assert_difference('Livestock.count') do
      post livestocks_url, params: { livestock: {  } }
    end

    assert_redirected_to livestock_url(Livestock.last)
  end

  test "should show livestock" do
    get livestock_url(@livestock)
    assert_response :success
  end

  test "should get edit" do
    get edit_livestock_url(@livestock)
    assert_response :success
  end

  test "should update livestock" do
    patch livestock_url(@livestock), params: { livestock: {  } }
    assert_redirected_to livestock_url(@livestock)
  end

  test "should destroy livestock" do
    assert_difference('Livestock.count', -1) do
      delete livestock_url(@livestock)
    end

    assert_redirected_to livestocks_url
  end
end
