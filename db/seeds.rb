# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Stadium.all.empty?
	Stadium.create(name: "Mejor estadio",capacity: 1000,address: "C/Padilla 284",stockBeers: 100,priceBeer: 250);
	Stadium.create(name: "Barcelona",capacity: 500,address: "C/Diagonal 4",stockBeers: 10,priceBeer: 250);
	Stadium.create(name: "Regaliz",capacity: 100,address: "C/De la piruleta 55",stockBeers: 500,priceBeer: 250);
	Stadium.create(name: "Imperial",capacity: 10000,address: "C/Estrella de la muerte 2",stockBeers: 1000,priceBeer: 250);
end