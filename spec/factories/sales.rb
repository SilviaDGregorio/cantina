FactoryGirl.define do
	factory :sale do
		information {Faker::Lorem.sentence}
		n_beers {Faker::Number.number(3)}
		price {Faker::Number.number(3)}
		type_transaction {Faker::Number.between(0, 1)}
		stadium_id 1
	end
end
