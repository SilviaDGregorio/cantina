class Api::StadiumsController < ApplicationController
	before_action :set_stadium, only: [:show, :edit, :update, :destroy,:changePriceBeer,:getStock,:getBeersSold,:getEarnings]
	respond_to :json

	# GET /api/stadiums/
	def index
		@stadiums = Stadium.all.order(:name)
	end

	# GET /api/stadiums/:id
	def show;end

	def changePriceBeer
	    if @stadium.update_columns(stadium_params)
	      @response= { msg: 'Changed priceBeer successfuly' , error: false} 
	    else
	      @response= { msg: 'Error, please try again later' , error: true} 
	    end		
	end
	
	# GET /api/stadiums/:id/stock
	def getStock
		if(@stadium)
			@response ={msg: 'Get stock from: ' + @stadium.name,error: false, stockBeers:@stadium.stockBeers}
		else
			@response ={msg: 'Make sure the params are correct',error: true, stockBeers:0}
		end
	end

	# GET /api/stadiums/:id/beersSold
	def getBeersSold
		if(@stadium)
			@response ={msg: 'Get beers sold from: ' + @stadium.name,error: false, beersSold:@stadium.beersSold}
		else
			@response ={msg: 'Make sure the params are correct',error: true, beersSold:0}
		end
	end

	# POST /api/stadiums/getEarnings   -> id,date_start,date_end
	def getEarnings
		if(!validateParams)
			priceSold=0;
			priceAdd=0;
			@salesSold = @stadium.sales.salesSoldDate(params[:date_start],params[:date_end]);
			@salesAdd = @stadium.sales.salesAddDate(params[:date_start],params[:date_end]);
			if(@salesSold.present?)
				priceSold=@salesSold.map(&:price).sum
			end
			if(@salesAdd.present?)
				priceAdd=@salesAdd.map(&:price).sum
			end
			earnings=priceSold-priceAdd
			@response ={msg: 'Earnings between (' +params[:date_start].to_s+","+params[:date_end].to_s+") : "+earnings.to_s,error: false, earnings:earnings}
		end
	end

	private

	    def validateParams
			if(!params.key?(:date_start) || !params.key?(:date_end))
				@response= { msg: 'Error with parameters' , error: false} 
			end
	    end
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
