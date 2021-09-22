# frozen_string_literal: true

require "rails_helper"

RSpec.describe AnalysesHelper, type: :helper do
  describe "available_analyses_typename" do
    it "returns available analyses" do
      expect(helper.available_analyses_typename).to eq(Analysis::AVAILABLE_ANALYSES)
    end
  end

  describe "available_analyses_typename_for_select" do
    let(:typenames_for_select) do
      [
        %w[Wordclouds wordclouds],
        %w[Ldb ldb]
      ]
    end

    it "returns an array of array for select" do
      expect(helper.available_analyses_typename_for_select).to eq(typenames_for_select)
    end
  end

  describe "categories_for_select" do
    let!(:processing) { create(:processing, :with_preprocessed_file_data) }
    let(:available_categories) do
      [
        %w[Consommer consommer]
      ]
    end

    it "returns an array of array for select" do
      expect(helper.categories_for_select(processing)).to eq(available_categories)
    end

    context "when the is not categories" do
      let!(:processing) { create(:processing) }

      it "returns an empty array for select" do
        expect(helper.categories_for_select(processing)).to eq([])
      end
    end
  end
end
