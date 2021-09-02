require "application_system_test_case"

class ProcessingsTest < ApplicationSystemTestCase
  setup do
    @processing = processings(:one)
  end

  test "visiting the index" do
    visit processings_url
    assert_selector "h1", text: "Processings"
  end

  test "creating a Processing" do
    visit processings_url
    click_on "New Processing"

    click_on "Create Processing"

    assert_text "Processing was successfully created"
    click_on "Back"
  end

  test "updating a Processing" do
    visit processings_url
    click_on "Edit", match: :first

    click_on "Update Processing"

    assert_text "Processing was successfully updated"
    click_on "Back"
  end

  test "destroying a Processing" do
    visit processings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Processing was successfully destroyed"
  end
end
