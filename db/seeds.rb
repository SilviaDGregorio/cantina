# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Stadium.all.empty?
	Stadium.create(name: "Mejor estadio",capacity: 1000,address: "C/Padilla 284",stockBeers: 100,priceBeer: 250)
	Sale.create(stadium_id: 1,information: "First 100 Beers",n_beers:100,price:0,type_transaction: 1)

	Stadium.create(name: "Barcelona",capacity: 500,address: "C/Diagonal 4",stockBeers: 10,priceBeer: 250)
	Sale.create(stadium_id: 2,information: "First 10 Beers",n_beers:10,price:0,type_transaction: 1)

	Stadium.create(name: "Regaliz",capacity: 100,address: "C/De la piruleta 55",stockBeers: 500,priceBeer: 250)
	Sale.create(stadium_id: 3,information: "First 500 Beers",n_beers:500,price:0,type_transaction: 1)

	Stadium.create(name: "Imperial",capacity: 10000,address: "C/Estrella de la muerte 2",stockBeers: 1000,priceBeer: 250)
	Sale.create(stadium_id: 4,information: "First 1000 Beers",n_beers:1000,price:0,type_transaction: 1)
end
