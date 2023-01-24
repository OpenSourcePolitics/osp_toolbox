# frozen_string_literal: true

require "rails_helper"

RSpec.describe CsvSerializer do
  subject(:serializer) { described_class }

  let!(:input_file) { create(:input_file) }
  let(:data) { input_file.file.download }

  describe ".serialize" do
    it "serializes the data" do
      expect(serializer.serialize(data).keys).to eq((0..13).to_a.map(&:to_s))
      expect(serializer.serialize(data).class).to eq(Hash)
    end
  end

  describe ".detect_colum_separator(data)" do
    it "returns the correct separator" do
      expect(serializer.detect_colum_separator(data)).to eq(";")
    end

    context "when there is no id column" do
      let(:data) { "title,body" }

      it "returns the corect separator" do
        expect(serializer.detect_colum_separator(data)).to eq(",")
      end
    end
  end
end
