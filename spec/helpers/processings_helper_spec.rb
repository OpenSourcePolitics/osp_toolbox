# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProcessingsHelper, type: :helper do
  describe "filter_analyses" do
    let(:wordcloud_anlayses) { create_list(:analysis, 3, :wordclouds) }
    let(:ldb_anlayses) { create_list(:analysis, 3, :ldb) }

    it "returns wordcloud analyse" do
      expect(
        helper.filter_analyses((ldb_anlayses + wordcloud_anlayses), "wordclouds")
      ).to eq(wordcloud_anlayses)
    end
  end
end
