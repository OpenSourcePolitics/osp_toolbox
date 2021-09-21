# frozen_string_literal: true

require "rails_helper"

RSpec.describe Notification, type: :model do
  subject { described_class }
  let!(:notification) do
    create(:notification,
           event_name: "dummy",
           resource_class: analysis.class.name,
           resource_id: analysis.id,
           target_id: user.id)
  end
  let!(:analysis) { create(:analysis) }
  let!(:user) { create(:user) }

  it "is valid" do
    expect(notification).to be_valid
  end

  describe ".register!" do
    it "creates a notification" do
      expect do
        subject.register!(
            event_name: "dummy",
            resource_class: analysis.class.name,
            resource_id: analysis.id,
            target_id: user.id
        )
      end.to change { subject.count }.by(1)
    end
  end

  describe ".notify!" do
    before do
      allow(subject).to receive(:send_notification)
                            .with(user, analysis.notification_message)
                            .and_return(true)
    end

    context "when notification is nil" do
      let!(:notification) { create(:notification) }

      it "does nothing" do
        expect(subject.notify!(analysis)).to eq(nil)
      end
    end

    it "destroys notification" do
      expect do
        subject.notify!(analysis)
        end.to change { subject.count }.by(-1)
    end
  end
end
