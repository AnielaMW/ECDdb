Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dances#index'

  resources :dances, only: [:index, :show]

  resources :users do
    resources :dances, except: [:index, :show]
  end
end
