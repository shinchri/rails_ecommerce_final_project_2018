Rails.application.routes.draw do

  resources :types, only: [:index, :show]
  resources :products, only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :order_items, only: [:index, :show]
  resources :levels, only: [:index, :show]
  resources :customers, only: [:index, :show]

  resources :search, only: [:index] do
    collection do
      get 'results'
    end
  end

  # another options
  #get 'search', to: 'search#index'
  #get 'search/results', to 'search#results'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
