# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Analyses_data", type: :request do
  let(:analysis) { create(:analysis) }
  let(:token) { "f84a8a0eb816bf8d11ca09bebdfb4001c35b56baa44fc228da4b8513056d98c3" }
  let(:archive_file) do
    Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/wordclouds.png"))
  end

  describe "POST /store_analysis_data" do
    before do
      post "/analysis_data", params: {
        token: token,
        archive: archive_file,
        analysis_id: analysis.id
      }
    end

    it "returns a 200" do
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:ok)
    end

    context "when token does not match" do
      let(:token) { "dummy" }

      it "returns a 401" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
