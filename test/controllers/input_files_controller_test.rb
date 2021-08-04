require "test_helper"

class InputFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @input_file = input_files(:one)
  end

  test "should get index" do
    get input_files_url
    assert_response :success
  end

  test "should get new" do
    get new_input_file_url
    assert_response :success
  end

  test "should create input_file" do
    assert_difference('InputFile.count') do
      post input_files_url, params: { input_file: { type: @input_file.type } }
    end

    assert_redirected_to input_file_url(InputFile.last)
  end

  test "should show input_file" do
    get input_file_url(@input_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_input_file_url(@input_file)
    assert_response :success
  end

  test "should update input_file" do
    patch input_file_url(@input_file), params: { input_file: { type: @input_file.type } }
    assert_redirected_to input_file_url(@input_file)
  end

  test "should destroy input_file" do
    assert_difference('InputFile.count', -1) do
      delete input_file_url(@input_file)
    end

    assert_redirected_to input_files_url
  end
end
