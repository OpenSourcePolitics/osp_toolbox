# frozen_string_literal: true

require "rails_helper"

RSpec.describe Analysis, type: :model do
  let!(:analysis) { create(:analysis) }

  it "is valid" do
    expect(analysis).to be_valid
  end
end
