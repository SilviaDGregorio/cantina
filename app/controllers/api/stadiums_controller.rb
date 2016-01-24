class Api::StadiumsController < ApplicationController
	before_action :set_stadium, only: [:show, :edit, :update, :destroy,:changePriceBeer,:getStock,:getBeersSold]
	respond_to :json

	# GET /api/stads.json
	def index
		@stadiums = Stadium.all.order(:name)
	end

	def show;end

	def changePriceBeer
	    if @stadium.update_columns(stadium_params)
	      @response= { msg: 'Changed priceBeer successfuly' , error: false} 
	    else
	      @response= { msg: 'Error, please try again later' , error: true} 
	    end		
	end

	def getStock
		if(@stadium)
			@response ={msg: 'Get stock from: ' + @stadium.name,error: false, stockBeers:@stadium.stockBeers}
		else
			@response ={msg: 'Make sure the params are correct',error: true, stockBeers:0}
		end
	end

	def getBeersSold
		if(@stadium)
			@response ={msg: 'Get beers sold from: ' + @stadium.name,error: false, beersSold:@stadium.beersSold}
		else
			@response ={msg: 'Make sure the params are correct',error: true, beersSold:0}
		end
	end

	private

	    # Use callbacks to share common setup or constraints between actions.
	   	def set_stadium 
			if Stadium.exists?(:id => params[:id])
				@stadium = Stadium.find(params[:id])			
			else
				@stadium = nil
			end    
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def stadium_params
	      params.permit(:id,:priceBeer,:stockBeers)
	    end

end
