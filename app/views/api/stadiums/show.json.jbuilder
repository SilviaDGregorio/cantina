json.stadium do
  json.name @stadium.name
  json.address @stadium.address
  json.capacity @stadium.capacity
  json.stockBeers   @stadium.stockBeers
  json.priceBeer @stadium.priceBeer
end
