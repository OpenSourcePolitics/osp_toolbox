require "rails_helper"

describe "Homepage", type: :system do
  let(:user) { create(:user) }
  before do
    login_as(user)
  end

  it "signs me in" do
    visit '/'
    expect(page).to have_content "Welcome to OSP toolbox"
    expect(page).to have_link "Comments mapping"
    expect(page).to have_link "Preprocessings"
    expect(page).to have_link "Exploratory data analysis"
  end
end