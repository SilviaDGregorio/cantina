json.response do
	json.msg @response[:msg]
	json.error @response[:error]
	json.id @response[:id] ? @response[:id] : ''
end
