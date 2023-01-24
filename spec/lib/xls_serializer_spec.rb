# frozen_string_literal: true

require "rails_helper"

RSpec.describe XlsSerializer do
  subject(:serializer) { described_class }

  let(:preprocessing) { create(:processing, :with_xls_file) }
  let(:data) { preprocessing.file }

  describe ".serialize" do
    it "serializes the data" do
      expect(serializer.serialize(data).keys).to eq((0..407).to_a.map(&:to_s))
      expect(serializer.serialize(data).class).to eq(Hash)
    end
  end
end
