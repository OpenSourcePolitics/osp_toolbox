# frozen_string_literal: true

require "rails_helper"

RSpec.describe "InputFiles", type: :request do
  let(:user) { create(:user) }
  let(:document) { create(:document) }
  let(:input_file) { create(:input_file, document: document) }
  let(:file) { Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/proposals.csv"), "text/csv") }
  let(:typename) { "Proposals" }

  before do
    login_as(user)
  end

  describe "GET /documents/:document_id/input_files/:id" do
    before do
      get "/documents/#{document.id}/input_files/#{input_file.id}"
    end

    it "assigns documents" do
      expect(assigns(:input_file)).to eq(input_file)
    end

    it "render show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET /documents/:document_id/input_files/new" do
    before do
      get "/documents/#{document.id}/input_files/new"
    end

    it "render new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "GET /documents/:document_id/input_files/:id/edit" do
    before do
      get "/documents/#{document.id}/input_files/#{input_file.id}/edit"
    end

    it "assigns documents" do
      expect(assigns(:input_file)).to eq(input_file)
    end

    it "render edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "POST /documents/:document_id/input_files" do
    let(:typename) { "Comments" }
    let(:file) { Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/comments.csv"), "text/csv") }

    context "when no input file exist" do
      before do
        post "/documents/#{document.id}/input_files", params: {
          input_file: {
            file: file,
            typename: typename
          }
        }
      end

      it "assigns documents" do
        expect(assigns(:input_file)).not_to eq(input_file)
      end

      it "redirects to input file" do
        expect(response).to redirect_to("/documents/#{Document.last.id}")
      end

      it "sends a flash notice" do
        expect(flash[:notice]).to match(/Input file was successfully created.*/)
      end
    end

    context "when an input file already exist for the document" do
      before do
        create(:input_file, document: document)

        post "/documents/#{document.id}/input_files", params: {
          input_file: {
            file: file,
            typename: typename
          }
        }
      end

      it "sends a flash notice" do
        expect(flash[:notice]).to match(/Input file was successfully created and document has been sent to processing*/)
      end

      context "and trying to create with the same typename" do
        let(:typename) { "Proposals" }

        it "render edit template" do
          expect(response).to render_template(:new)
        end
      end
    end
  end

  describe "PUT /documents/:document_id/input_files/:id" do
    let(:typename) { "Comments" }
    let(:file) { Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/comments.csv"), "text/csv") }

    before do
      put "/documents/#{document.id}/input_files/#{input_file.id}", params: {
        input_file: {
          file: file,
          typename: typename
        }
      }
    end

    it "assigns input_file" do
      expect(assigns(:input_file)).to eq(input_file)
    end

    it "redirects to input file" do
      expect(response).to redirect_to("/documents/#{document.id}/input_files/#{input_file.id}")
    end

    it "updates the input file" do
      expect(InputFile.last.typename).to eq(typename)
    end

    context "when input file is invalid" do
      let(:typename) { "Proposals" }

      it "render edit template" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE /documents/:document_id/input_files/:id" do
    before do
      delete "/documents/#{document.id}/input_files/#{input_file.id}"
    end

    it "destroys input file" do
      expect(InputFile.where(id: input_file.id)).to eq([])
    end

    it "redirects to input file" do
      expect(response).to redirect_to("/documents/#{document.id}")
    end
  end
end
