Rails.application.routes.draw do

  root 'public/products#top'

  devise_for :admins

  namespace :admin do
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :genres, only: [:index, :create, :edit, :update, :show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_products, only: [:update]
  end

  devise_for :customers
get 'about' => 'public/products#about'
  namespace :public do

    resources :products, only: [:index, :show]


    resources :customers, only: [:show, :edit, :update]
        # get 'customers/withdrawal'
        # get 'customers/unsubscribe'
    resources :cart_products, only: [:index, :create, :update, :destroy]
      # delete '/cart_products' => 'cart_products#destroy_all', as: 'cart_products_destroy_all'
    resources :orders, only: [:create, :new, :index, :show]
        # get 'orders/confirm'
        # get 'orders/completed'
    resources :shipping_addressess, only: [:index, :create, :destroy, :edit, :update]

  end
end
