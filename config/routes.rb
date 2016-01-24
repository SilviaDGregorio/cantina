Rails.application.routes.draw do
 namespace :api , defaults: {format: :json} do  
    resources :stadiums, only: [:index, :show] do
		resources :sales, only: [:index, :show] do
			collection do
				post 'saleBeers/:numberBeers',to: 'sales#saleBeers', as: 'sale_beers'
			end
		end
		collection do
			get ':id/stock', to: 'stadiums#getStock', as: 'get_stock'
			post 'changePriceBeer', to: 'stadiums#changePriceBeer', as: 'change_price_beer'        
		end
    end
  end 
end
