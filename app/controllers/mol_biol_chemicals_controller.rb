class MolBiolChemicalsController < ApplicationController
  before_action :set_mol_biol_chemical, only: [:show, :edit, :update, :destroy]

  # GET /mol_biol_chemicals
  # GET /mol_biol_chemicals.json
  def index
    @mol_biol_chemicals_all = MolBiolChemical.all
    if params[:rodzaj]
      @mol_biol_chemicals = MolBiolChemical.where({rodzaj: params[:rodzaj]})
      @selector = true
    else
      @mol_biol_chemicals  = @mol_biol_chemicals_all
      @selector = false
    end
    respond_to do |format|
      format.html
      format.csv {send_data @mol_biol_chemicals_all.to_csv}
    end
  end

    # GET /mol_biol_chemicals/new
  def new
    @mol_biol_chemical = MolBiolChemical.new
  end

  # GET /mol_biol_chemicals/1/edit
  def edit
  end

  # POST /mol_biol_chemicals
  # POST /mol_biol_chemicals.json
  def create
    @mol_biol_chemical = MolBiolChemical.new(mol_biol_chemical_params)

    respond_to do |format|
      if @mol_biol_chemical.save
        format.html { redirect_to mol_front_index_path, notice: 'Molecular biology chemical was successfully created.' }
        format.json { render :show, status: :created, location: @mol_biol_chemical }
      else
        format.html { render :new }
        format.json { render json: @mol_biol_chemical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mol_biol_chemicals/1
  # PATCH/PUT /mol_biol_chemicals/1.json
  def update
    respond_to do |format|
      if @mol_biol_chemical.update(mol_biol_chemical_params)
        format.html { redirect_to mol_front_index_path, notice: 'Molecular biology chemical was successfully updated.' }
        format.json { render :show, status: :ok, location: @mol_biol_chemical }
      else
        format.html { render :edit }
        format.json { render json: @mol_biol_chemical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mol_biol_chemicals/1
  # DELETE /mol_biol_chemicals/1.json
  def destroy
    @mol_biol_chemical.destroy
    respond_to do |format|
      format.html { redirect_to mol_biol_chemicals_url, notice: 'Molecular biology chemical was successfully deleted.' }
      format.json { head :no_content }
    end
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mol_biol_chemical
      @mol_biol_chemical = MolBiolChemical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mol_biol_chemical_params
      params.require(:mol_biol_chemical).permit(:name, :producer, :catalogue_number,
       :quantity, :delivery_date, :rodzaj, :state, :comments, :file, :place)
    end
end
