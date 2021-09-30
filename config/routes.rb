Rails.application.routes.draw do
  
  devise_for :admins
  
  namespace :admin do
    resources :products, only: [:index,:new,:create,:show,:edit,:update]
    resources :orders, only: [:index,:show,:update]
    resources :genres, only: [:index,:create,:edit,:update, :show]
    resources :costomers, only: [:index,:show,:edit,:update]
    resources :order_products, only: [:update]
  end

  devise_for :costomers

end
