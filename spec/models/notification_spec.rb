# frozen_string_literal: true

require "rails_helper"

RSpec.describe Notification, type: :model do
  let!(:notification) { create(:notification) }

  it "is valid" do
    expect(notification).to be_valid
  end
end
