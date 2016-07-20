class RegularChemicalsController < ApplicationController
  before_action :set_regular_chemical, only: [:show, :edit, :update, :destroy]

  # GET /regular_chemicals
  # GET /regular_chemicals.json
  def index
    @regular_chemicals = RegularChemical.all
  end

  # GET /regular_chemicals/1
  # GET /regular_chemicals/1.json
  def show
  end

  # GET /regular_chemicals/new
  def new
    @regular_chemical = RegularChemical.new
  end

  # GET /regular_chemicals/1/edit
  def edit
  end

  # POST /regular_chemicals
  # POST /regular_chemicals.json
  def create
    @regular_chemical = RegularChemical.new(regular_chemical_params)

    respond_to do |format|
      if @regular_chemical.save
        format.html { redirect_to regular_chemicals_path, notice: 'Regular chemical was successfully created.' }
        format.json { render :show, status: :created, location: @regular_chemical }
      else
        format.html { render :new }
        format.json { render json: @regular_chemical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regular_chemicals/1
  # PATCH/PUT /regular_chemicals/1.json
  def update
    respond_to do |format|
      if @regular_chemical.update(regular_chemical_params)
        format.html { redirect_to regular_chemicals_path, notice: 'Regular chemical was successfully updated.' }
        format.json { render :show, status: :ok, location: @regular_chemical }
      else
        format.html { render :edit }
        format.json { render json: @regular_chemical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regular_chemicals/1
  # DELETE /regular_chemicals/1.json
  def destroy
    @regular_chemical.destroy
    respond_to do |format|
      format.html { redirect_to regular_chemicals_url, notice: 'Regular chemical was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regular_chemical
      @regular_chemical = RegularChemical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regular_chemical_params
      params.require(:regular_chemical).permit(:short_name, :full_name, :formula, :producer, :catalogue_number, :delivery_date, :comments)
    end
end
