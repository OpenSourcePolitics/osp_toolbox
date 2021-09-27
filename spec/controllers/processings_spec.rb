# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Processings", type: :request do
  let!(:user) { create(:user) }
  let!(:processings) { create_list(:processing, 5, :with_preprocessed_file_data) }

  before do
    login_as(user)
  end

  describe "GET /index" do
    before { get "/processings" }

    it "assigns processings" do
      expect(assigns(:processings)).to match_array(processings)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end
end
