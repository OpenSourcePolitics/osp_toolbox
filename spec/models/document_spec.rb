# frozen_string_literal: true

require "rails_helper"

RSpec.describe Document, type: :model do
  let!(:document) { create(:document) }

  it "is valid" do
    expect(document).to be_valid
  end
end
