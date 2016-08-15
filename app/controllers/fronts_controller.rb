class FrontsController < ApplicationController
  before_action :done_responsibilities ,only: [:index]
  before_action :select_responsibilities, only: [:index]
  before_action :select_regular_chemicals, only: [:index]
  before_action :select_molecular_chemicals, only: [:index]
  require 'date'

  def index    
  end

  def select_responsibilities
    @responsibilities_pending = Responsibility.where({done: false})
  end
  def select_regular_chemicals
    @regular_chemicals_empty = RegularChemical.where('state > 0')
  end
   def select_molecular_chemicals
    @mol_biol_chemicals_empty = MolBiolChemical.where('state > 0')
  end

  def primers
    @data = Primer.all
    respond_to do |format|
      format.html
      format.csv {send_data @data.to_csv}
    end
  end
   def competent_cells
    @data = CompetentCell.all
    respond_to do |format|
      format.html
      format.csv {send_data @data.to_csv}
    end
  end
   def bacterial_stocks
    @data = BacterialStock.all
    respond_to do |format|
      format.html
      format.csv {send_data @data.to_csv}
    end
  end
   def sequences
    @data = Sequence.all
    respond_to do |format|
      format.html
      format.csv {send_data @data.to_csv}
    end
  end
  def sequence_attachments
    @data = SequenceAttachment.all
    respond_to do |format|
      format.html
      format.csv {send_data @data.to_csv}
    end
  end
   def regular_chemicals
    @data = RegularChemical.all
    respond_to do |format|
      format.html
      format.csv {send_data @data.to_csv}
    end
  end
   def mol_biol_chemicals
    @data = MolBiolChemical.all
    respond_to do |format|
      format.html
      format.csv {send_data @data.to_csv}
    end
  end
   def vectors
    @data = Vector.all
    respond_to do |format|
      format.html
      format.csv {send_data @data.to_csv}
    end
  end
   def vector_attachments
    @data = VectorAttachment.all
    respond_to do |format|
      format.html
      format.csv {send_data @data.to_csv}
    end
  end
   def responsibilities
    @data = Responsibility.all
    respond_to do |format|
      format.html
      format.csv {send_data @data.to_csv}
    end
  end
   def manuals
    @data = Manual.all
    respond_to do |format|
      format.html
      format.csv {send_data @data.to_csv}
    end
  end
   def users
    @data = User.all
    respond_to do |format|
      format.html
      format.csv {send_data @data.to_csv}
    end
  end
  
  private
    def done_responsibilities
      if Responsibility.first
        resp = Responsibility.all
        resp.each do |r|
          if r.date_of_action < Date.today
            r.done = true
            r.save
          else
            r.done = false
            r.save
          end
        end
      end
     end
end