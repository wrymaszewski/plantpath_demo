class BacterialFrontsController < ApplicationController
	def index
		@bacterial_stocks = BacterialStock.all
	end
	def filter_species
	    if params[:species]
	    	filter = params[:species]
	    	redirect_to bacterial_stocks_url(:species => filter)
	    else
	    	redirect_to bacterial_stocks_url
	    end
	end
end
