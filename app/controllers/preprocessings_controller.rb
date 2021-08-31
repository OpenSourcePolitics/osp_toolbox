class PreprocessingsController < ApplicationController
  before_action :set_preprocessing, only: %i[ show edit update destroy ]

  # GET /preprocessings or /preprocessings.json
  def index
    @preprocessings = Preprocessing.all
  end

  # GET /preprocessings/1 or /preprocessings/1.json
  def show
  end

  # GET /preprocessings/new
  def new
    @preprocessing = Preprocessing.new
  end

  # GET /preprocessings/1/edit
  def edit
  end

  # POST /preprocessings or /preprocessings.json
  def create
    @preprocessing = Preprocessing.new(preprocessing_params)

    respond_to do |format|
      if @preprocessing.save
        format.html { redirect_to @preprocessing, notice: "Preprocessing was successfully created." }
        format.json { render :show, status: :created, location: @preprocessing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @preprocessing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preprocessings/1 or /preprocessings/1.json
  def update
    respond_to do |format|
      if @preprocessing.update(preprocessing_params)
        format.html { redirect_to @preprocessing, notice: "Preprocessing was successfully updated." }
        format.json { render :show, status: :ok, location: @preprocessing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @preprocessing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preprocessings/1 or /preprocessings/1.json
  def destroy
    @preprocessing.destroy
    respond_to do |format|
      format.html { redirect_to preprocessings_url, notice: "Preprocessing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preprocessing
      @preprocessing = Preprocessing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def preprocessing_params
      params.require(:preprocessing).permit(:title, :client, :url, :file)
    end
end
