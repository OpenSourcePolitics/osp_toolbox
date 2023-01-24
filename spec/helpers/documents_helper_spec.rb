# frozen_string_literal: true

require "rails_helper"

RSpec.describe DocumentsHelper do
  let!(:document) { create(:document, :with_archive) }

  describe "ready_to_process?" do
    context "when document has less than two input files" do
      it "returns false" do
        expect(helper).not_to be_ready_to_process(document)
      end
    end

    context "when document has two input files" do
      # rubocop:disable RSpec/LetSetup
      let!(:comments_input_file) { create(:input_file, :with_comment_file, document:) }
      let!(:proposals_input_file) { create(:input_file, document:) }
      # rubocop:enable RSpec/LetSetup

      it "returns true" do
        expect(helper).to be_ready_to_process(document)
      end
    end
  end

  describe "document_archive_for" do
    before do
      helper.instance_variable_set(:@virtual_path, "documents_helper.document_archive_for")
    end

    it "returns a link to archive" do
      expect(helper.document_archive_for(document)).to include("Download")
    end

    context "when there is no archive" do
      let!(:document) { create(:document) }

      it "returns no archive message" do
        expect(helper.document_archive_for(document)).to eq("No available archive")
      end
    end
  end
end
