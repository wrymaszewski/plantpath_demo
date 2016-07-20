class BacterialStocksController < ApplicationController
  before_action :set_all_sequences, only: [:index]
  before_action :set_sequence, only: [:show, :edit, :update, :destroy, :new, :create]
  before_action :set_bacterial_stock, only: [:show, :edit, :update, :destroy]

  # GET /bacterial_stocks
  # GET /bacterial_stocks.json
  def index
    @bacterial_stocks = BacterialStock.all
  end

  # GET /bacterial_stocks/1
  # GET /bacterial_stocks/1.json
  def show
  end

  # GET /bacterial_stocks/new
  def new
    @bacterial_stock = @sequence.bacterial_stocks.new
  end

  # GET /bacterial_stocks/1/edit
  def edit
  end

  # POST /bacterial_stocks
  # POST /bacterial_stocks.json
  def create
    @bacterial_stock = @sequence.bacterial_stocks.new(bacterial_stock_params)

    respond_to do |format|
      if @bacterial_stock.save
        format.html { redirect_to @sequence, notice: 'Bacterial stock was successfully created.' }
        format.json { render :show, status: :created, location: @sequence }
      else
        format.html { render :new }
        format.json { render json: @bacterial_stock.errors, status: :unprocessable_entity }
      end
    end
    @bacterial_stock.fill_sequence_name
  end

  # PATCH/PUT /bacterial_stocks/1
  # PATCH/PUT /bacterial_stocks/1.json
  def update
    respond_to do |format|
      if @bacterial_stock.update(bacterial_stock_params)
        format.html { redirect_to @sequence, notice: 'Bacterial stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @bacterial_stock }
      else
        format.html { render :edit }
        format.json { render json: @bacterial_stock.errors, status: :unprocessable_entity }
      end
    end
    @bacterial_stock.fill_sequence_name
  end

  # DELETE /bacterial_stocks/1
  # DELETE /bacterial_stocks/1.json
  def destroy
    @bacterial_stock.destroy
    respond_to do |format|
      format.html { redirect_to @sequence, notice: 'Bacterial stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bacterial_stock
      @bacterial_stock = BacterialStock.find(params[:id])
    end

    def set_sequence
      @sequence = Sequence.find(params[:sequence_id])
    end
    def set_all_sequences
      @sequences = Sequence.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bacterial_stock_params
      params.require(:bacterial_stock).permit(:number, :insert, :plasmid, :tag, :species, :strain, :antibiotic_resistance, :methods_of_cloning, :source, :comments, :references)
    end
end
