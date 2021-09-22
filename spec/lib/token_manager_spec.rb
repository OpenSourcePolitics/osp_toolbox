# frozen_string_literal: true

require "rails_helper"

RSpec.describe TokenManager do
  subject { described_class }
  let(:string) { "dummy" }
  let(:another_string) { "dummy2" }
  let(:string_token) { "c7f136a75e917cd9b949e125e1a50c0cfd5adb976520c93c3b5859f833490b68" }

  describe "generate_token" do
    it "returns predictable token" do
      expect(subject.generate_token(string)).to eq(string_token)
    end

    it "returns unique token" do
      expect(subject.generate_token(another_string)).not_to eq(string_token)
    end
  end

  describe "valid_token?" do
    it "returns true if same token" do
      expect(subject.valid_token?(string, string_token)).to be_truthy
    end

    it "returns false if not the same token" do
      expect(subject.valid_token?(another_string, string_token)).to be_falsey
    end
  end
end
