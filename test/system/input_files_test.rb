require "application_system_test_case"

class InputFilesTest < ApplicationSystemTestCase
  setup do
    @input_file = input_files(:one)
  end

  test "visiting the index" do
    visit input_files_url
    assert_selector "h1", text: "Input Files"
  end

  test "creating a Input file" do
    visit input_files_url
    click_on "New Input File"

    fill_in "Type", with: @input_file.type
    click_on "Create Input file"

    assert_text "Input file was successfully created"
    click_on "Back"
  end

  test "updating a Input file" do
    visit input_files_url
    click_on "Edit", match: :first

    fill_in "Type", with: @input_file.type
    click_on "Update Input file"

    assert_text "Input file was successfully updated"
    click_on "Back"
  end

  test "destroying a Input file" do
    visit input_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Input file was successfully destroyed"
  end
end
