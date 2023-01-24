# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  let(:user) { create(:user) }

  it "is valid" do
    expect(user).to be_valid
  end

  describe ".nickname=" do
    let(:user) { create(:user, nickname: "dummy") }

    it "adds an @ to the nickname" do
      expect(user.nickname).to eq("@dummy")
    end

    context "when nickname starts with an '@'" do
      let(:user) { create(:user, nickname: "@dummy") }

      it "doesn't adds another @ to the nickname" do
        expect(user.nickname).not_to eq("@@dummy")
      end
    end
  end

  describe ".check_email_address" do
    context "when email is from a forbidden domain" do
      before do
        allow(Rails.configuration).to receive(:allowed_domains).and_return(["example.org"])
      end

      it "adds an error to the model" do
        user.email = "foo@bar.com"
        expect(user).not_to be_valid
        expect(user.errors.messages[:base]).to eq(["The domain you are using is wrong, please use one from the list: example.org"])
      end
    end

    context "when allowed_domains is empty" do
      before do
        allow(Rails.configuration).to receive(:allowed_domains).and_return("")
      end

      it "returns nil" do
        expect(user.check_email_address).to be_falsey
      end
    end
  end
end
