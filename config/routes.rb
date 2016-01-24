Rails.application.routes.draw do
 namespace :api , defaults: {format: :json} do  
    resources :stadiums do
    	resources :sales
      collection do
      	get ':id/stock', to: 'stadiums#getStock', as: 'get_stock'
        post ':id/changePriceBeer', to: 'stadiums#changePriceBeer', as: 'change_price_beer'
      end
    end
  end 
end
