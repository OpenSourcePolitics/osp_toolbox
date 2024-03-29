# frozen_string_literal: true

# Documents controller
class DocumentsController < ApplicationController
  before_action :set_document, only: %i[process_archive show edit update destroy]

  # GET /documents or /documents.json
  def index
    @query = Document.ransack(params[:q])
    @documents = @query.result(distinct: true).page(params[:page])
  end

  # GET /documents/1 or /documents/1.json
  def show; end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit; end

  # POST /documents or /documents.json
  def create
    @document = Document.new(document_params.merge(user: current_user))

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: t(".create") }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1 or /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: t(".update") }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1 or /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: t(".destroy") }
      format.json { head :no_content }
    end
  end

  def process_archive
    ProcessDocumentJob.perform_later(@document.id)

    respond_to do |format|
      format.html { redirect_to document_path(@document), notice: t(".process_archive") }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = Document.find(params.try(:[], :id) || params.try(:[], :document_id))
  end

  # Only allow a list of trusted parameters through.
  def document_params
    params.require(:document).permit(:title, :ready)
  end
end
