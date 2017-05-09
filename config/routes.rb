Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dances#index'

  resources :users
  resources :dances do
    resources :dance_comments, only: [:new, :create]
  end
  resources :dance_comments, except: [:new, :create]
  resources :formations
  resources :meters
  resources :comment_types

  namespace :api do
    resources :dance_comments, only: [:create]
  end
end
