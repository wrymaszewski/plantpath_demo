class SequencesController < ApplicationController
   before_action :set_sequence, only: [:show, :edit, :update, :destroy]


  # GET /sequences
  # GET /sequences.json
  def index
    @sequences = Sequence.all
  end

  # GET /sequences/1
  # GET /sequences/1.json
  def show
    @sequence_attachments = @sequence.sequence_attachments.all
  end

  # GET /sequences/new
  def new
    @sequence = Sequence.new
  end

  # GET /sequences/1/edit
  def edit
  end

  # POST /sequences
  # POST /sequences.json
  def create
    @sequence = Sequence.new(sequence_params)

    respond_to do |format|
      if @sequence.save
        if params[:sequence_attachments]
            params[:sequence_attachments]['file'].each do |a|
             @sequence_attachment = @sequence.sequence_attachments.create!(:file => a)
            end
         end 
        format.html { redirect_to @sequence, notice: 'Sequence was successfully created.' }
        format.json { render :show, status: :created, location: @sequence }
      else
        format.html { render :new }
        format.json { render json: @sequence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sequences/1
  # PATCH/PUT /sequences/1.json
  def update
    respond_to do |format|
      if @sequence.update(sequence_params)
        format.html { redirect_to sequences_path, notice: 'Sequence was successfully updated.' }
        format.json { render :show, status: :ok, location: @sequence }
      else
        format.html { render :edit }
        format.json { render json: @sequence.errors, status: :unprocessable_entity }
      end
    end
    @sequence.change_names
  end

  # DELETE /sequences/1
  # DELETE /sequences/1.json
  def destroy
    @sequence.destroy
    respond_to do |format|
      format.html { redirect_to sequences_url, notice: 'Sequence was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequence
      @sequence = Sequence.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def sequence_params
      params.require(:sequence).permit(:name, :organism, sequence_attachments_attributes: [:name, :id, :sequence_id, :file],
        primers_attributes: [:id, :sequence_id, :checked, :gene_sequence], bacterial_stocks: [:id, :sequence_id, :sequence_name, :wstawka, :strain, :species, :tag, :antibiotic_resistance, :methods_of_cloning, :source, :comments])
    end
end
