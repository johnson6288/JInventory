require 'test_helper'

class OccasionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @occasion = occasions(:one)
  end

  test "should get index" do
    get occasions_url
    assert_response :success
  end

  test "should get new" do
    get new_occasion_url
    assert_response :success
  end

  test "should create occasion" do
    assert_difference('Occasion.count') do
      post occasions_url, params: { occasion: { comments: @occasion.comments, occasionName: @occasion.occasionName } }
    end

    assert_redirected_to occasion_url(Occasion.last)
  end

  test "should show occasion" do
    get occasion_url(@occasion)
    assert_response :success
  end

  test "should get edit" do
    get edit_occasion_url(@occasion)
    assert_response :success
  end

  test "should update occasion" do
    patch occasion_url(@occasion), params: { occasion: { comments: @occasion.comments, occasionName: @occasion.occasionName } }
    assert_redirected_to occasion_url(@occasion)
  end

  test "should destroy occasion" do
    assert_difference('Occasion.count', -1) do
      delete occasion_url(@occasion)
    end

    assert_redirected_to occasions_url
  end
end
