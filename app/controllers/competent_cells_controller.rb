class CompetentCellsController < ApplicationController
  before_action :set_competent_cell, only: [:show, :edit, :update, :destroy]

  # GET /competent_cells
  # GET /competent_cells.json
  def index
    @competent_cells = CompetentCell.all
    respond_to do |format|
      format.html
      format.csv {send_data @competent_cells.to_csv}
    end
  end

  # GET /competent_cells/new
  def new
    @competent_cell = CompetentCell.new
  end

  # GET /competent_cells/1/edit
  def edit
  end

  # POST /competent_cells
  # POST /competent_cells.json
  def create
    @competent_cell = CompetentCell.new(competent_cell_params)

    respond_to do |format|
      if @competent_cell.save
        format.html { redirect_to competent_cells_url, notice: 'Competent cells stock was successfully created.' }
        format.json { render :show, status: :created, location: @competent_cell }
      else
        format.html { render :new }
        format.json { render json: @competent_cell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competent_cells/1
  # PATCH/PUT /competent_cells/1.json
  def update
    respond_to do |format|
      if @competent_cell.update(competent_cell_params)
        format.html { redirect_to competent_cells_url, notice: 'Competent cells stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @competent_cell }
      else
        format.html { render :edit }
        format.json { render json: @competent_cell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competent_cells/1
  # DELETE /competent_cells/1.json
  def destroy
    @competent_cell.destroy
    respond_to do |format|
      format.html { redirect_to competent_cells_url, notice: 'Competent cells stock was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competent_cell
      @competent_cell = CompetentCell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competent_cell_params
      params.require(:competent_cell).permit(:place, :species, :strain, :antibiotic_resistance, :usage, :comments, :genotype)
    end
end
