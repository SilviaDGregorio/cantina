class Api::StadiumsController < ApplicationController
	before_action :set_stadium, only: [:show, :edit, :update, :destroy,:changePriceBeer]
	respond_to :json

	# GET /api/stads.json
	def index
		@stadiums = Stadium.all.order(:name)
	end

	def show
	end

	def changePriceBeer
	    if @stadium.update_columns(stadium_params)
	      @response= { msg: 'Changed priceBeer successfuly' , error: false} 
	    else
	      @response= { msg: 'Error, please try again later' , error: true} 
	    end		
	end
	
	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_stadium
	      @stadium = Stadium.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def stadium_params
	      params.permit(:id,:priceBeer)
	    end

end
