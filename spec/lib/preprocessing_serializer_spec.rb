# frozen_string_literal: true

require "rails_helper"

RSpec.describe PreprocessingSerializer do
  subject { described_class }

  let(:preprocessing) { create(:processing) }

  describe ".serialize" do
    context "when file is csv type" do
      it "returns a hash" do
        allow(CsvSerializer).to receive(:serialize).with(preprocessing.file.download).and_call_original

        expect(subject.serialize(preprocessing).class).to eq(Hash)
      end
    end

    context "when file is csv type" do
      let(:preprocessing) { create(:processing, :with_xls_file) }
      it "returns a hash" do
        allow(XlsSerializer).to receive(:serialize).with(preprocessing.file).and_call_original

        expect(subject.serialize(preprocessing).class).to eq(Hash)
      end
    end
  end
end
