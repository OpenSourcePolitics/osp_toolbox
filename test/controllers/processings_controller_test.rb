require "test_helper"

class ProcessingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @processing = processings(:one)
  end

  test "should get index" do
    get processings_url
    assert_response :success
  end

  test "should get new" do
    get new_processing_url
    assert_response :success
  end

  test "should create processing" do
    assert_difference('Processing.count') do
      post processings_url, params: { processing: {  } }
    end

    assert_redirected_to processing_url(Processing.last)
  end

  test "should show processing" do
    get processing_url(@processing)
    assert_response :success
  end

  test "should get edit" do
    get edit_processing_url(@processing)
    assert_response :success
  end

  test "should update processing" do
    patch processing_url(@processing), params: { processing: {  } }
    assert_redirected_to processing_url(@processing)
  end

  test "should destroy processing" do
    assert_difference('Processing.count', -1) do
      delete processing_url(@processing)
    end

    assert_redirected_to processings_url
  end
end
