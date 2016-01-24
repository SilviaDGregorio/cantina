json.response do
	json.msg @response[:msg]
	json.error @response[:error]
	json.earnings @response[:earnings]
end
