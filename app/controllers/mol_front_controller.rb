class MolFrontController < ApplicationController
	def index
		@mol_biol_chemicals = MolBiolChemical.all
		@regular_chemicals = RegularChemical.all
	end

	def filter_molecular
		if params[:rodzaj]
		    filter = params[:rodzaj]
		    redirect_to mol_biol_chemicals_url(:rodzaj => filter)
		else
			redirect_to mol_biol_chemicals_url
		end
	end 

	def filter_regular
		if params[:rodzaj]
	    	filter = params[:rodzaj]
	    	redirect_to regular_chemicals_url(:rodzaj => filter)
		else
			redirect_to regular_chemicals_url
		end
	end
end
