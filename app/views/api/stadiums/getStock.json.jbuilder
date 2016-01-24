json.response do
	json.msg @response[:msg]
	json.error @response[:error]
	json.stockBeers @response[:stockBeers]
end
