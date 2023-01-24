# frozen_string_literal: true

require "rails_helper"

describe "Authentication" do
  let(:user) { create(:user) }

  describe "Sign in" do
    it "signs me in" do
      visit "/"
      expect(page).to have_content "Log in"

      fill_in :user_email, with: user.email
      fill_in :user_password, with: user.password
      click_button "Log in"

      expect(page).to have_content("Welcome to OSP toolbox")
    end
  end

  describe "Sign out" do
    before do
      login_as(user)
    end

    it "signs me out" do
      visit "/"
      expect(page).to have_content "Welcome to OSP toolbox"

      click_link "Sign out"

      expect(page).to have_content("Log in")
    end
  end
end
