json.response do
	json.msg @response[:msg]
	json.error @response[:error]
	json.beersSold @response[:beersSold]
end
