# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationMailer do
  let(:dummy_mailer) do
    Class.new(described_class)
  end

  describe "default from" do
    it "returns from" do
      expect(dummy_mailer.new.default_params[:from]).to eq("from@example.com")
    end
  end
end
