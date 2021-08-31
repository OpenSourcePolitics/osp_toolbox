require "application_system_test_case"

class PreprocessingsTest < ApplicationSystemTestCase
  setup do
    @preprocessing = preprocessings(:one)
  end

  test "visiting the index" do
    visit preprocessings_url
    assert_selector "h1", text: "Preprocessings"
  end

  test "creating a Preprocessing" do
    visit preprocessings_url
    click_on "New Preprocessing"

    fill_in "Client", with: @preprocessing.client
    fill_in "Title", with: @preprocessing.title
    fill_in "Url", with: @preprocessing.url
    click_on "Create Preprocessing"

    assert_text "Preprocessing was successfully created"
    click_on "Back"
  end

  test "updating a Preprocessing" do
    visit preprocessings_url
    click_on "Edit", match: :first

    fill_in "Client", with: @preprocessing.client
    fill_in "Title", with: @preprocessing.title
    fill_in "Url", with: @preprocessing.url
    click_on "Update Preprocessing"

    assert_text "Preprocessing was successfully updated"
    click_on "Back"
  end

  test "destroying a Preprocessing" do
    visit preprocessings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Preprocessing was successfully destroyed"
  end
end
