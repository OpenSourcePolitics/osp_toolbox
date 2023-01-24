# frozen_string_literal: true

require "rails_helper"

RSpec.describe PreprocessingSerializer do
  subject(:serializer) { described_class }

  let(:preprocessing) { create(:processing) }

  describe ".serialize" do
    context "when file is csv type" do
      it "returns a hash" do
        allow(CsvSerializer).to receive(:serialize).with(preprocessing.file.download).and_call_original

        expect(serializer.serialize(preprocessing).class).to eq(Hash)
      end
    end

    context "when file is xls type" do
      let(:preprocessing) { create(:processing, :with_xls_file) }

      it "returns a hash" do
        allow(XlsSerializer).to receive(:serialize).with(preprocessing.file).and_call_original

        expect(serializer.serialize(preprocessing).class).to eq(Hash)
      end
    end
  end
end
