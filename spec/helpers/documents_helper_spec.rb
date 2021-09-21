# frozen_string_literal: true

require "rails_helper"

RSpec.describe DocumentsHelper, type: :helper do
  let!(:document) { create(:document, :with_archive) }

  describe "ready_to_process?" do
    context "when document has less than two input files" do
      it "returns false" do
        expect(helper.ready_to_process?(document)).to be_falsey
      end
    end

    context "when document has two input files" do
      let!(:comments_input_file) { create(:input_file, :with_comment_file, document: document) }
      let!(:proposals_input_file) { create(:input_file, document: document) }

      it "returns true" do
        expect(helper.ready_to_process?(document)).to be_truthy
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
