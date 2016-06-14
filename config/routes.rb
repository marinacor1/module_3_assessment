Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  resources :stores, only: [:show]

  get '/search', to: 'search#index'
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :items
    end
  end
end
