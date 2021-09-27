# frozen_string_literal: true

require "rails_helper"

RSpec.describe DocumentInputFilesSerializer do
  subject { described_class }
  let!(:document) { create(:document) }
  let!(:comments_input_file) { create(:input_file, :with_comment_file, document: document) }
  let!(:proposals_input_file) { create(:input_file, document: document) }

  describe ".serialize" do
    it "serializes the input files" do
      expect(subject.serialize(document.reload).keys).to eq(%w[Comments Proposals])
      expect(subject.serialize(document.reload)["Comments"].length).to eq(25)
      expect(subject.serialize(document.reload)["Proposals"].length).to eq(14)
      expect(subject.serialize(document).class).to eq(Hash)
    end
  end
end
