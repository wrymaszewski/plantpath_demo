class VectorsController < ApplicationController
  before_action :set_vector, only: [:show, :edit, :update, :destroy]

  # GET /vectors
  # GET /vectors.json
  def index
    @vectors = Vector.all
    respond_to do |format|
      format.html
      format.csv {send_data @vectors.to_csv}
    end
  end

    # GET /vectors/new
  def new
    @vector = Vector.new
  end

  def show

  end
  # GET /vectors/1/edit
  def edit
  end

  # POST /vectors
  # POST /vectors.json
  def create
    @vector = Vector.new(vector_params)

    respond_to do |format|
      if @vector.save
        format.html { redirect_to vectors_path, notice: 'Vector was successfully created.' }
        format.json { render :show, status: :created, location: @vector }
      else
        format.html { render :new }
        format.json { render json: @vector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vectors/1
  # PATCH/PUT /vectors/1.json
  def update
    respond_to do |format|
      if @vector.update(vector_params)
        format.html { redirect_to vectors_path, notice: 'Vector was successfully updated.' }
        format.json { render :show, status: :ok, location: @vector }
      else
        format.html { render :edit }
        format.json { render json: @vector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vectors/1
  # DELETE /vectors/1.json
  def destroy
    @vector.destroy
    respond_to do |format|
      format.html { redirect_to vectors_url, notice: 'Vector was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vector
      @vector = Vector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vector_params
      params.require(:vector).permit(:name, :size, :antibiotic_resistance,
       :copy_number, :usage, :comments, :casette, vector_attachments_attributes: [:id, :file, :vector_id])
    end
end
