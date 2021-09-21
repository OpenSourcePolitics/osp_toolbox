# frozen_string_literal: true

require "rails_helper"

RSpec.describe InputFile, type: :model do
  let!(:input_file) { create(:input_file) }

  it "is valid" do
    expect(input_file).to be_valid
  end
end
