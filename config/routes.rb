Rails.application.routes.draw do
 namespace :api , defaults: {format: :json} do  
    resources :stadiums, only: [:index, :show] do
		resources :sales, only: [:index, :show] do
			collection do
				post 'saleBeers',to: 'sales#saleBeers', as: 'sale_beers'
				post 'addBeers',to: 'sales#addBeers', as: 'add_beers'				
			end
		end
		collection do
			get ':id/stock', to: 'stadiums#getStock', as: 'get_stock'
			get ':id/beersSold', to: 'stadiums#getBeersSold', as: 'get_beers_sold'
			post 'changePriceBeer', to: 'stadiums#changePriceBeer', as: 'change_price_beer'        
		end
    end
  end 
end
