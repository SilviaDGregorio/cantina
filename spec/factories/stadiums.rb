FactoryGirl.define do
	factory :stadium do
		name {Faker::Company.name}
		capacity {Faker::Number.number(5)}
		address {Faker::Address.street_address}
		stockBeers {Faker::Number.number(3)}
		priceBeer {Faker::Number.number(3)}
	end
end
