# frozen_string_literal: true

require "rails_helper"

RSpec.describe Document do
  let(:document) { create(:document) }

  it "is valid" do
    expect(document).to be_valid
  end

  context "when title is empty" do
    it "is invalid" do
      document.title = nil

      expect(document).to be_invalid
    end
  end

  describe ".process_archive" do
    let!(:input_file_proposal) { create(:input_file, document:) }
    let!(:input_file_comments) { create(:input_file, :with_comment_file, document:) }

    it "calls ProcessDocumentJob" do
      expect(ProcessDocumentJob).to receive(:perform_later).with(document)

      document.process_archive
    end

    context "when input files are less than 2" do
      let(:input_file_comments) { nil }

      it "doesn't enqueue a job" do
        expect do
          document.process_archive
        end.not_to have_enqueued_job(ProcessDocumentJob)
      end
    end
  end
end
