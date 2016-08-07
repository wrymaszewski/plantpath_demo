class MolFrontController < ApplicationController
	def index
		@mol_biol_chemicals = MolBiolChemical.all
		@regular_chemicals = RegularChemical.all
	end

	def filter_molecular
	    filter = params[:rodzaj]
	    redirect_to mol_biol_chemicals_url(:rodzaj => filter)
	end 

	def filter_regular
	    filter = params[:rodzaj]
	    redirect_to regular_chemicals_url(:rodzaj => filter)
	end
end
