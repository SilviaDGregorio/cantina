FactoryGirl.define do
	factory :stadium do
		name {Faker::Company.name+Faker::Number.number(3)}
		capacity {Faker::Number.number(5)}
		address {Faker::Address.street_address}
		stockBeers {Faker::Number.number(3)}
		priceBeer {Faker::Number.number(3)}
		beersSold 0
	end
end
