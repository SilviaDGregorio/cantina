class Api::SalesController < ApplicationController
	before_action :set_sales, only: [:show, :edit, :update, :destroy,:changePriceBeer,:getStock]
	respond_to :json

	# POST /api/stadiums/:stadium_id/sales/saleBeers  -> numberBeers
	def saleBeers
		if(validateParams)
			@response
		else
			information = params[:information] ? params[:information] : ''
			numberBeers = params[:numberBeers].to_i
			
			@stadium=Stadium.find(params[:stadium_id])
			stock = @stadium.stockBeers.to_i-numberBeers
			if(stock>=0)
				price = numberBeers*@stadium.priceBeer
				sale=Sale.create(stadium_id: @stadium.id,n_beers: numberBeers,price: price,information: information)
				if(sale)
					@stadium.update(:stockBeers => stock,:beersSold=> numberBeers);
					@response= { msg: 'Transacction has been completed successfully' , error: false, id: sale.id}
				else
					@response= { msg: 'Transacction error, please try again later' , error: true}
				end
			else
				@response = { msg: 'You can\'t sale more than stock' , error: true}
			end
		end
	end

	# POST /api/stadiums/:stadium_id/sales/addBeers  -> numberBeers
	def addBeers
		if(validateParams)
			@response
		else
			information = params[:information] ? params[:information] : ''
			numberBeers = params[:numberBeers].to_i
			
			@stadium=Stadium.find(params[:stadium_id])
			stock = @stadium.stockBeers.to_i+numberBeers

			price = numberBeers*(@stadium.priceBeer/10)
			sale=Sale.create(stadium_id: @stadium.id,n_beers: numberBeers,price: price,information: information,type_transaction: 1)
			if(sale)
				@stadium.update(:stockBeers => stock);
				@response= { msg: 'Transacction has been completed successfully' , error: false, id: sale.id}
			else
				@response= { msg: 'Transacction error, please try again later' , error: true}
			end

		end
	end

	
	private

	    # Use callbacks to share common setup or constraints between actions.
	   	def set_sales	   
			if Sale.exists?(:id => params[:id])
				@sale = Sale.find(params[:id])			
			else
				@sale = nil
			end    
	    end

	    def validateParams
			if(!params.key?(:stadium_id) || !params.key?(:numberBeers))
				@response= { msg: 'Error with parameters' , error: false} 
			elsif(!Stadium.exists?(:id =>params[:stadium_id]))
				@response= { msg: 'Wrong stadium' , error: false}
			end
	    end
end
