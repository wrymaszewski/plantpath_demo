class PrimersController < ApplicationController
  
  end
  before_action :set_all_sequences, only: [:index]
  before_action :set_sequence, only: [:show, :edit, :update, :destroy, :new, :create]
  before_action :set_primer, only: [:show, :edit, :update, :destroy]
  

  # GET /primers
  # GET /primers.json
  def index
    @grid = PrimersGrid.new(params[:primers_grid]) do |scope|
      scope.page(params[:page])
    end
  

  # GET /primers/1
  # GET /primers/1.json
  def show
  end

  # GET /primers/new
  def new
    @primer = @sequence.primers.new
  end

  # GET /primers/1/edit
  def edit
  end

  # POST /primers
  # POST /primers.json
  def create
    @primer = @sequence.primers.new(primer_params)
   

    respond_to do |format|
      if @primer.save
        format.html { redirect_to @sequence, notice: 'Primer was successfully created.' }
        format.json { render :show, status: :created, location: @sequence }
      else
        format.html { render :new }
        format.json { render json: @sequence.errors, status: :unprocessable_entity }
      end
    end
    @primer.refine
    @primer.calculate_tm
    @primer.fill_sequence_name
    @primer.calculate_length
  end

  # PATCH/PUT /primers/1
  # PATCH/PUT /primers/1.json
  def update
    respond_to do |format|
      if @primer.update(primer_params)
        format.html { redirect_to @sequence, notice: 'Primer was successfully updated.' }
        format.json { render :show, status: :ok, location: @sequence }
      else
        format.html { render :edit }
        format.json { render json: @sequence.errors, status: :unprocessable_entity }
      end
    end
    @primer.refine
    @primer.calculate_tm
    @primer.fill_sequence_name
    @primer.calculate_length
  end

  # DELETE /primers/1
  # DELETE /primers/1.json
  def destroy
    @primer.destroy
    respond_to do |format|
      format.html { redirect_to @sequence, notice: 'Primer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_primer
      @primer = @sequence.primers.find(params[:id])
    end

    def set_sequence
      @sequence = Sequence.find(params[:sequence_id])
    end
    def set_sequence_unknown
      @sequence = Sequence.where({name: "unknown"})
    end
    def set_all_sequences
      @sequences = Sequence.all
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def primer_params
      params.require(:primer).permit(:name, :p_sequence, :Tm, :comments, :direction,
       :sequence_id, :gene_sequence, :position, :length, :checked)
    end
end
