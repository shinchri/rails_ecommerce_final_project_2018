# frozen_string_literal: true

Rails.application.routes.draw do
  resources :carts, only: %i[index] do
    collection do
      post :clear_shopping_cart_lists
    end
  end

  resources :types, only: %i[index show]
  resources :products, only: %i[index show] do
    member do
      post :add_to_shopping_cart
    end
  end

  resources :orders, only: %i[index show]
  resources :order_items, only: %i[index show]
  resources :levels, only: %i[index show]
  resources :customers, only: %i[index show]

  resources :search, only: [:index] do
    collection do
      get 'results'
    end
  end

  # another options
  # get 'search', to: 'search#index'
  # get 'search/results', to 'search#results'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
