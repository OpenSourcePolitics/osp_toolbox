# frozen_string_literal: true

require "rails_helper"

RSpec.describe Processing, type: :model do
  let!(:processing) { build(:processing) }

  it "is valid" do
    expect(processing).to be_valid
  end

  context "without a title" do
    it "is invalid" do
      processing.title = nil

      expect(processing).to be_invalid
    end
  end

  describe "string_to_generate_token" do
    it "returns a predictable string" do
      expect(processing.string_to_generate_token).to eq("QwQoe3CIT5kVsjaJryKWTA==")
    end
  end

  describe "preprocessed_data" do
    it "returns a nil" do
      expect(processing.preprocessed_data).to eq(nil)
    end

    context "when there is a preprocessed_file_data" do
      let!(:processing) { create(:processing, :with_preprocessed_file_data) }

      it "returns a hash" do
        expect(processing.preprocessed_data.class.name).to eq("Hash")
      end
    end
  end

  describe "parse_categories" do
    let!(:processing) { create(:processing, :with_preprocessed_file_data) }
    it "returns a nil" do
      expect(processing.parse_categories).to eq(["consommer"])
    end
  end
end
