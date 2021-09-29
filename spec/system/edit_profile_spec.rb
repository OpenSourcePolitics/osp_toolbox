# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Edit profile", type: :system do
  context "When user is not logged in" do
    it "redirects to the signin page" do
        expect(page).to have_current_path "/"
    end
  end
  
  context "When user is logged in" do
    let!(:user) { create(:user) }
    before do
        login_as(user)
    end
    it "displays the edit form" do
        visit "/users/edit"

        expect(page).to have_content "Edit User"
        expect(page).to have_field("Nickname", with: user.nickname)
        expect(page).to have_field("Email", with: user.email)
        expect(page).to have_field("Password")
        expect(page).to have_field("Password confirmation")
        expect(page).to have_field("Current password")
        expect(page).to have_button("Update")
        
        expect(page).to have_content "Cancel my account"
        expect(page).to have_content "Unhappy?"
        expect(page).to have_button("Cancel my account")
        expect(page).to have_link "Back"
    end

    context "When submitting the form" do
        context "When current password is not provided" do
            it "displays an error" do
                visit "/users/edit"
                click_on "Update"

                expect(page).to have_content "Not saved"
            end
        end

        it "updates successfully" do
            visit "/users/edit"
            fill_in "Current password", with: user.password
            click_on "Update"

            expect(page).to have_current_path("/")
            within ".toast-body" do
                expect(page).to have_content "Your account has been updated successfully."
            end
        end

        context "When there is an error in the form" do
            it "doesn't update successfully" do
                visit "/users/edit"
                fill_in "Current password", with: user.password
                fill_in "Email", with: ""
                click_on "Update"

                expect(page).to have_content "Not saved"
            end
        end
    end
    end
end
