# frozen_string_literal: true

require "rails_helper"

RSpec.describe Notification do
  subject(:notifier) { described_class }

  let!(:notification) do
    create(:notification,
           event_name: "dummy",
           resource_class: analysis.class.name,
           resource_id: analysis.id,
           target_id: user.id)
  end
  let!(:analysis) { create(:analysis) }
  let!(:user) { create(:user) }

  let(:text) { "[Analysis #{analysis.typename} for #{analysis.processing.title} is over.](#{link})" }
  let(:link) { "http://change-me.org/processings/#{analysis.processing.id}/analyses/#{analysis.id}" }
  let(:content) do
    {
      title_link: link,
      text: "Hello #{user.nickname}\n#{text}"
    }
  end
  let(:url) { URI("change-me.org") }

  it "is valid" do
    expect(notification).to be_valid
  end

  describe ".register!" do
    it "creates a notification" do
      expect do
        notifier.register!(
          event_name: "dummy",
          resource_class: analysis.class.name,
          resource_id: analysis.id,
          target_id: user.id
        )
      end.to change(notifier, :count).by(1)
    end
  end

  describe ".notify!" do
    before do
      # rubocop:disable RSpec/SubjectStub
      allow(notifier).to receive(:send_notification)
        .with(user, analysis.notification_message)
        .and_return(true)
      # rubocop:enable RSpec/SubjectStub
    end

    context "when notification is nil" do
      # rubocop:disable RSpec/LetSetup
      let!(:notification) { create(:notification) }
      # rubocop:enable RSpec/LetSetup

      it "does nothing" do
        expect(notifier.notify!(analysis)).to be_falsey
      end
    end

    it "destroys notification" do
      expect do
        notifier.notify!(analysis)
      end.to change(notifier, :count).by(-1)
    end
  end

  describe ".send_notification" do
    before do
      allow(RequestBuilder).to receive(:send_post_request).with(content, url).and_return(true)
    end

    it "sends a notification" do
      expect(notifier.send_notification(user, analysis.notification_message)).to be_truthy
    end
  end
end
