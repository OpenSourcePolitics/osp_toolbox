# frozen_string_literal: true

require "rails_helper"

RSpec.describe PreprocessingsHelper, type: :helper do
  let(:processing) do
    create(:processing,
           sent_to_preprocessing_at: Time.utc(2021, 1, 1, 12, 0, 0),
           preprocessed_at: Time.utc(2021, 1, 1, 12, 12, 0))
  end

  describe "preprocessing_duration" do
    it "returns a duration" do
      expect(helper.preprocessing_duration(processing)).to eq("12 minutes")
    end

    context "when preprocessed has not been done yet" do
      let(:processing) { create(:processing) }

      it "returns nothing" do
        expect(helper.preprocessing_duration(processing)).to eq("")
      end
    end
  end
end
