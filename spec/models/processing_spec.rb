# frozen_string_literal: true

require "rails_helper"

RSpec.describe Processing, type: :model do
  let!(:processing) { create(:processing) }

  it "is valid" do
    expect(processing).to be_valid
  end
end
