# frozen_string_literal: true

require "rails_helper"

RSpec.describe DocumentInputFilesSerializer do
  subject(:serializer) { described_class }

  # rubocop:disable RSpec/LetSetup
  let!(:document) { create(:document) }
  let!(:comments_input_file) { create(:input_file, :with_comment_file, document:) }
  let!(:proposals_input_file) { create(:input_file, document:) }
  # rubocop:enable RSpec/LetSetup

  describe ".serialize" do
    it "serializes the input files" do
      expect(serializer.serialize(document.reload).keys).to match_array(%w[Comments Proposals])
      expect(serializer.serialize(document.reload)["Comments"].length).to eq(25)
      expect(serializer.serialize(document.reload)["Proposals"].length).to eq(14)
      expect(serializer.serialize(document).class).to eq(Hash)
    end
  end
end
