require "test_helper"

class PreprocessingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @preprocessing = preprocessings(:one)
  end

  test "should get index" do
    get preprocessings_url
    assert_response :success
  end

  test "should get new" do
    get new_preprocessing_url
    assert_response :success
  end

  test "should create preprocessing" do
    assert_difference('Preprocessing.count') do
      post preprocessings_url, params: { preprocessing: { client: @preprocessing.client, title: @preprocessing.title, url: @preprocessing.url } }
    end

    assert_redirected_to preprocessing_url(Preprocessing.last)
  end

  test "should show preprocessing" do
    get preprocessing_url(@preprocessing)
    assert_response :success
  end

  test "should get edit" do
    get edit_preprocessing_url(@preprocessing)
    assert_response :success
  end

  test "should update preprocessing" do
    patch preprocessing_url(@preprocessing), params: { preprocessing: { client: @preprocessing.client, title: @preprocessing.title, url: @preprocessing.url } }
    assert_redirected_to preprocessing_url(@preprocessing)
  end

  test "should destroy preprocessing" do
    assert_difference('Preprocessing.count', -1) do
      delete preprocessing_url(@preprocessing)
    end

    assert_redirected_to preprocessings_url
  end
end
