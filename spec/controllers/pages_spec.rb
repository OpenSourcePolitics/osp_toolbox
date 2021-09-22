# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Pages", type: :request do
  let(:user) { create(:user) }

  describe "GET /" do
    it "redirects to sign in" do
      get ""

      expect(response).to redirect_to("/users/sign_in")
    end

    context "when login in" do
      before do
        login_as(user)
        get ""
      end

      it "render home template" do
        expect(response).to render_template(:home)
      end
    end
  end
end
