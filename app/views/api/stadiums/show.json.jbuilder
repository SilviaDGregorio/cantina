if(@stadium!=nil)
	json.stadium do
	  json.name @stadium.name
	  json.address @stadium.address
	  json.capacity @stadium.capacity
	  json.stockBeers   @stadium.stockBeers
	  json.beersSold @stadium.beersSold
	  json.priceBeer @stadium.priceBeer
	end
else
	json.response do
	json.msg 'Make sure that params are correct'
	json.error true
	end
end
