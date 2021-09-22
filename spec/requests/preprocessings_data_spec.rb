# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Preprocessings_data", type: :request do
  let(:processing) { create(:processing) }
  let(:token) { "faa5833ff55bd4d7302048a460dac60b25a3d3925f728ab82f0154475043c257" }
  let(:preprocessings_datum) do
    { "_json" => JSON.dump({ preprocessed_data: { foo: "bar" } }) }
  end

  describe "POST /preprocessed_data" do
    before do
      post "/preprocessed_data", params: {
        token: token,
        preprocessings_datum: preprocessings_datum,
        preprocessing_id: processing.id
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
