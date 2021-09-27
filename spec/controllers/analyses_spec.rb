# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Analyses", type: :request do
  let(:user) { create(:user) }
  let(:analysis) { create(:analysis) }
  let(:processing) { analysis.processing }

  before do
    login_as(user)
  end

  describe "GET /processings/:processing_id/analyses" do
    before do
      get "/processings/#{processing.id}/analyses"
    end

    it "assigns analyses" do
      expect(assigns(:analyses)).to eq([analysis])
    end

    it "render index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET /processings/:processing_id/analyses/:id" do
    before do
      get "/processings/#{processing.id}/analyses/#{analysis.id}"
    end

    it "assigns analysis" do
      expect(assigns(:analysis)).to eq(analysis)
    end

    it "render edit template" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET /processings/:processing_id/analyses/:id/new" do
    before do
      get "/processings/#{processing.id}/analyses/new"
    end

    it "render edit template" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST /processings/:processing_id/analyses" do
    context "when a similar analysis already exists" do
      before do
        allow(AnalysisJob).to receive(:perform_later).with(processing, "wordclouds", user, "").and_return(true)
        post "/processings/#{processing.id}/analyses", params: {
          analysis: {
            typename: analysis.typename,
            category: ""
          }
        }
      end

      it "redirects to existing analysis" do
        expect(response).to redirect_to("/processings/#{processing.id}/analyses/#{analysis.id}")
      end
    end

    context "when no similar analysis exists" do
      let(:typename) { "ldb" }

      before do
        allow(AnalysisJob).to receive(:perform_later).with(processing, "ldb", user, "").and_return(true)
        post "/processings/#{processing.id}/analyses", params: {
          analysis:
              {
                typename: typename,
                category: ""
              }
        }
      end

      it "redirects to the new analysis" do
        expect(response).not_to redirect_to("/processings/#{processing.id}/analyses/#{analysis.id}")
        expect(response).to redirect_to("/processings/#{processing.id}/analyses/#{Analysis.last.id}")
      end

      context "when analysis is invalid" do
        let(:typename) { "dummy" }

        it "render new template" do
          expect(response).to render_template(:new)
        end
      end
    end
  end

  describe "DELETE /analyses/:id" do
    before do
      delete "/processings/#{processing.id}/analyses/#{analysis.id}"
    end

    it "destroys input file" do
      expect(Analysis.where(id: analysis.id)).to eq([])
    end

    it "redirects to analyses" do
      expect(response).to redirect_to("/processings/#{processing.id}/analyses")
    end
  end

  describe "GET /preprocessings/:preprocessing_id/redo_preprocessing" do
    before do
      allow(AnalysisJob.perform_later(processing, "wordclouds", user, ""))
      post "/processings/#{processing.id}/analyses/#{analysis.id}/redo_analysis", params: {}
    end

    it "assigns analysis" do
      expect(assigns(:analysis)).to eq(analysis)
    end

    it "redirects to analyses" do
      expect(response).to redirect_to("/processings/#{processing.id}/analyses")
    end
  end
end
