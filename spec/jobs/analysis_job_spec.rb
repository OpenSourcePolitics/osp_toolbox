# frozen_string_literal: true

require "rails_helper"
require "json"

RSpec.describe AnalysisJob, type: :job do
  subject { described_class }
  let!(:processing) { create(:processing, :with_preprocessed_file_data) }

  let!(:analysis) do
    Analysis.find_or_create_by!(typename: typename, processing: processing, category: category)
  end

  let(:user) { create(:user) }
  let(:typename) { "wordclouds" }

  let(:category) { "" }
  let(:content) do
    JSON.parse(analysis.processing.preprocessed_file_data.download)
  end
  let(:token) { "a756c16f85a7182ffd6e01183ff4c0fd2c41d49b025f58d1d9e9a6a87690ce8b" }
  let(:url) do
    URI("https://change-me.org/#{analysis.typename}?analysis_id=#{analysis.id}&token=#{token}")
  end

  before do
    allow(RequestBuilder).to receive(:send_post_request).with(content, url, wait_for_answer: false).and_return(true)
  end

  describe "#perform" do
    it "creates a notification" do
      expect do
        subject.perform_now(analysis.processing, analysis.typename, user)
      end.to change { Notification.count }.by(1)
    end

    context "when there is a category" do
      let(:category) { "consommer" }
      let(:url) do
        URI("https://change-me.org/#{analysis.typename}?analysis_id=#{analysis.id}&subset_category=#{category}&token=#{token}")
      end

      it "creates a notification" do
        expect do
          subject.perform_now(analysis.processing, analysis.typename, user, category)
        end.to change { Notification.count }.by(1)
      end
    end
  end
end
