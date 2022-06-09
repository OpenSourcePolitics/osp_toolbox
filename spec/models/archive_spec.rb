# frozen_string_literal: true

require "rails_helper"

RSpec.describe Archive, type: :model do
  let!(:archive) { create(:archive) }

  it "is valid" do
    expect(archive).to be_valid
  end

  describe ".store_archive!" do
    it "creates an attached file" do
      # rubocop:disable Style/OpenStructUse
      expect(archive.store_archive!(OpenStruct.new(response: "foo/bar"))).to eq(1)
      # rubocop:enable Style/OpenStructUse
    end
  end
end
