# frozen_string_literal: true

require "rails_helper"

RSpec.describe Document, type: :model do
  let(:document) { create(:document) }

  it "is valid" do
    expect(document).to be_valid
  end

  context "when title is empty" do
    it "is invalid" do
      document.title = nil

      expect(document).to be_invalid
    end
  end
end
