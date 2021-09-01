# frozen_string_literal: true

# Input files controller
class InputFilesController < ApplicationController
  before_action :set_input_file, only: %i[show edit update destroy]
  before_action :document

  # GET /input_files/1 or /input_files/1.json
  def show; end

  # GET /input_files/new
  def new
    @input_file = InputFile.new
  end

  # GET /input_files/1/edit
  def edit; end

  # POST /input_files or /input_files.json
  def create
    @input_file = InputFile.new(input_file_params.merge(document: document))

    respond_to do |format|
      if @input_file.save
        format.html { redirect_to document_path(id: @document), notice: "Input file was successfully created." }
        format.json { render :show, status: :created, location: @input_file }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @input_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /input_files/1 or /input_files/1.json
  def update
    respond_to do |format|
      if @input_file.update(input_file_params)
        format.html { redirect_to @input_file, notice: "Input file was successfully updated." }
        format.json { render :show, status: :ok, location: @input_file }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @input_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /input_files/1 or /input_files/1.json
  def destroy
    @input_file.destroy
    respond_to do |format|
      format.html { redirect_to document_path(id: @document), notice: "Input file was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_input_file
    @input_file = InputFile.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def input_file_params
    params.require(:input_file).permit(:file, :typename)
  end

  def document
    @document = Document.find(params[:document_id])
  end

  def before_action(action)
    send(action)
  end
end
