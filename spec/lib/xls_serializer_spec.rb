# frozen_string_literal: true

require "rails_helper"

RSpec.describe XlsSerializer do
  subject { described_class }

  let(:preprocessing) { create(:processing, :with_xls_file) }
  let(:data) { preprocessing.file }

  describe ".serialize" do
    it "serializes the data" do
      expect(subject.serialize(data).keys).to eq((0..407).to_a.map(&:to_s))
      expect(subject.serialize(data).class).to eq(Hash)
    end
  end
end
