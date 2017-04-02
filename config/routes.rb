Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dances#index'

  resources :users
  resources :dances
  resources :dance_comments
  resources :formations
  resources :meters
  resources :comment_types
end
