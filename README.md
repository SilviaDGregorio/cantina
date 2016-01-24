# cantina

1. Design the database for all the backend (draft) 
	Está en el fichero Code_challenger.mwb y se puede abrir con el mysql workbench

2. Detect the use cases/user histories (quick draft, don’t explain too much, just be clear)
	Está en el fichero user_histories.

3. Write down the URL endpoints of the API.
	- POST /api/stadiums/:stadium_id/sales/saleBeers  -> numberBeers
	- POST /api/stadiums/:stadium_id/sales/addBeers  -> numberBeers
	- GET /api/stadiums/
	- GET /api/stadiums/:id
	- GET /api/stadiums/:id/stock	
	- GET /api/stadiums/:id/beersSold
	- POST /api/stadiums/getEarnings   -> id,date_start,date_end

4. Implement an API only for the beers part. No need to implement sessions, backoffice 
and users. 

	Exec:
		$git clone git@github.com:SilviaDGregorio/cantina.git
		$cd cantina
		$bundle install
		$rails s

5. Test your code 
	rspec spec
