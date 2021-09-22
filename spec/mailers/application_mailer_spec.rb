# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationMailer, type: :mailer do
  class DummyMailer < ApplicationMailer
  end

  describe "default from" do
    it "returns from" do
      expect(DummyMailer.new.default_params[:from]).to eq("from@example.com")
    end
  end
end
