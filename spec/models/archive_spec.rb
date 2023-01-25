# frozen_string_literal: true

require "rails_helper"

RSpec.describe Archive do
  let!(:archive) { create(:archive) }

  it "is valid" do
    expect(archive).to be_valid
  end

  describe ".store_archive!" do
    it "creates an attached file" do
      expect(archive.store_archive!(OpenStruct.new(response: "foo/bar"))).to be_truthy
    end
  end
end
