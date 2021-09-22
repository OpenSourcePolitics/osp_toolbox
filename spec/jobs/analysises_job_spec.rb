# frozen_string_literal: true

require "rails_helper"

RSpec.describe AnalysisesJob, type: :job do
  subject { described_class }

  let(:processing) { create(:processing) }

  describe "#perform" do
    it "enqueues two job" do
      expect do
        subject.perform_now(processing)
      end.to have_enqueued_job(AnalysisJob).exactly(Analysis::AVAILABLE_ANALYSES.count)
    end
  end
end
