# frozen_string_literal: true

require "rails_helper"

RSpec.describe Sanitizer do
  subject { described_class }
  describe ".filename" do
    let(:filenames) { %w[dummy-name-for#my%file 123_dummy_file dummyname] }

    let(:sanitized_filename) { %w[dummy_name_for_my_file 123_dummy_file dummyname] }

    it "returns a proper filename" do
      filenames.each_with_index do |filename, index|
        expect(subject.filename(filename)).to eq(sanitized_filename[index])
      end
    end

    context "when filename is blank" do
      it "returns a Date string" do
        allow(DateTime).to receive(:now).and_return("1632352627")

        expect(subject.filename("")).to eq("1632352627")
      end
    end
  end
end
