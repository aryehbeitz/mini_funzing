Rails.application.routes.draw do
  resources :activities
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "activities#index"
  get '/orders/confirmation/:order_id' => 'orders#confirmation', :as => :order_confirmation
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
