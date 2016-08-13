class VectorAttachmentsController < ApplicationController
  before_action :set_vector, only: [:new, :create, :destroy]
  before_action :set_vector_attachment, only: [:edit, :destroy]

  def new
    @vector_attachment = @vector.vector_attachments.new
  end

  def create
    @vector_attachment = @vector.vector_attachments.new(vector_attachment_params)

    respond_to do |format|
      if @vector_attachment.save
        format.html { redirect_to @vector, notice: 'Vector attachment was successfully created.' }
        format.json { render :show, status: :created, location: @vector_attachment }
      else
        format.html { render :new }
        format.json { render json: @vector_attachment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @vector_attachment.destroy
    respond_to do |format|
      format.html { redirect_to @vector, notice: 'Vector attachment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vector_attachment
      @vector_attachment = @vector.vector_attachments.find(params[:id])
    end
    def set_vector
      @vector = Vector.find(params[:vector_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vector_attachment_params
      params.require(:vector_attachment).permit(:name, :type, :file, :vector_id, :comments)
    end
end
