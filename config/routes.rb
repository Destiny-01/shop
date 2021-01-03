Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "pages#index"
  get 'shop' => 'pages#shop'
  get 'cart' => 'carts#cart'
  get 'checkout' => 'pages#checkout'
  get 'single-product' => 'pages#single-product'
  get 'store' => 'pages#store'

  resources :carts
  resources :product_items
 end
