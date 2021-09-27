# frozen_string_literal: true

require "rails_helper"

RSpec.describe Analysis, type: :model do
  let!(:analysis) { create(:analysis, processing: processing) }
  let!(:processing) { create(:processing, :with_preprocessed_file_data, title: "dummy") }

  it "is valid" do
    expect(analysis).to be_valid
  end

  describe "string_to_generate_token" do
    it "returns a predictable string" do
      expect(analysis.string_to_generate_token).to eq("wordclouds_oMoglCCiXohO764wZikEXw==")
    end
  end

  describe "detect_extension" do
    it "returns png" do
      expect(analysis.detect_extension).to eq("png")
    end

    context "when typename is ldb" do
      let!(:analysis) { create(:analysis, :ldb, processing: processing) }
      it "returns xslx" do
        expect(analysis.detect_extension).to eq("xlsx")
      end
    end
  end

  describe "notification_message" do
    it "returns a string with a predictable message" do
      expect(analysis.notification_message).to eq({
                                                    link: "http://change-me.org/processings/#{processing.id}/analyses/#{analysis.id}",
                                                    text: "Analysis wordclouds for dummy is over."
                                                  })
    end
  end
end
