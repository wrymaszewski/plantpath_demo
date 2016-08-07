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
    @regular_chemicals_empty = RegularChemical.where('state IS NOT "full"')
  end
   def select_molecular_chemicals
    @mol_biol_chemicals_empty = MolBiolChemical.where('state IS NOT "full"')
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