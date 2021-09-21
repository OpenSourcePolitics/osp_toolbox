# frozen_string_literal: true

require "rails_helper"

RSpec.describe Archive, type: :model do
  let!(:archive) { create(:archive) }

  it "is valid" do
    expect(archive).to be_valid
  end
end
